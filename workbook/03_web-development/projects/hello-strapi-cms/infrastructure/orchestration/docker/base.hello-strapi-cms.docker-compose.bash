#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

export HOST_USER_ID=$(id -u)
export HOST_GROUP_ID=$(id -g)

APP_NAME=""
# inspired from maven phases (https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)
PHASE=""

for arg in "$@"; do
    case $arg in
    --app-name=*)
        APP_NAME="${arg#*=}"
        shift
        ;;
    --phase=*)
        PHASE="${arg#*=}"
        shift
        ;;
    esac
done

if [ -z "$APP_NAME" ]; then
    echo "Please provide the app name"
    exit 1
fi

if [ -z "$PHASE" ]; then
    echo "Please provide the phase"
    exit 1
fi

ENV_FILE="../../configuration/env/.${APP_NAME}.compose.env"
KEYS_BACKUP_FILE="./keys_backup.env"
COMPOSE_FILE_DEV="./base.${APP_NAME}.docker-compose.yml"
COMPOSE_FILE_PROD=""

source ${ENV_FILE}

DB_BACKUP_DIR="../../../database/backup"

function list() {
    echo "[ 📜 🐳 --- compose list ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} ps
}

function up() {
    echo "[ 🟢 🐳 --- compose up ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} up --detach --build
    list
}

function down() {
    echo "[ 🛑 🐳 --- compose down ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} down
    list
}

function down-clean() {
    echo "[ 🛑 🐳 --- compose down clean ]"
    backup-db
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} down --volumes --rmi all
    list
    clean-pg-admin-tmp
}

function clean-pg-admin-tmp() {
    echo "[ 🧹 🐳 --- clean pg admin .tmp/* ]"
    rm -rfv ../../../database/.tmp-data
}

function logs() {
    echo "[ 📜 🐳 --- compose logs ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} logs --follow
}

function save-backup-file() {
    echo "[ 📦 🐳 --- save backup file ]"

    if [ ! -d "${DB_BACKUP_DIR}" ]; then
        mkdir -p ${DB_BACKUP_DIR}
    fi

    if [ -f "${DB_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        cp ${DB_BACKUP_DIR}/${APP_NAME}.sql ${DB_BACKUP_DIR}/${APP_NAME}.$(date +%Y%m%d%H%M%S).sql
    fi
}

function backup-db() {
    echo "[ 📦 🐳 --- backup db ]"
    save-backup-file
    docker exec -i ${APP_NAME}-postgresql-database-1 pg_dump -U ${DATABASE_USERNAME} -h ${DATABASE_HOST} -p ${DATABASE_PORT} -Fc -f ${DB_BACKUP_DIR}/${APP_NAME}.sql ${DATABASE_NAME}

}

function restore-db() {
    echo "[ 📦 🐳 --- restore db ]"
    docker stop ${APP_NAME}
    docker exec -i ${APP_NAME}-postgresql-database-1 psql -U ${DATABASE_USERNAME} -d ${DATABASE_NAME} <${DB_BACKUP_DIR}/${APP_NAME}.sql
    docker start ${APP_NAME}
}

function backup-keys() {
    echo "[ 📦 --- Backing up Strapi keys and database credentials ]"

    if [ ! -f "$ENV_FILE" ]; then
        echo "Error: Environment file not found at $ENV_FILE"
        exit 1
    fi

    # Extract the required keys and database credentials
    grep -E "^(APP_KEYS|API_TOKEN_SALT|ADMIN_JWT_SECRET|TRANSFER_TOKEN_SALT|JWT_SECRET|DATABASE_CLIENT|DATABASE_HOST|DATABASE_PORT|DATABASE_NAME|DATABASE_USERNAME|DATABASE_PASSWORD)" "$ENV_FILE" >"$KEYS_BACKUP_FILE"

    # Verify the backup file was created
    if [ -f "$KEYS_BACKUP_FILE" ]; then
        echo "✅ Keys and database credentials have been backed up to $KEYS_BACKUP_FILE"
    else
        echo "❌ Failed to create the keys backup file."
        exit 1
    fi

    # ask user for a password to encrypt the backup file
    read -sp "Enter a password to encrypt the backup file: " ZIP_PASSWORD
    # zip and encrypt the backup file
    zip -P "${ZIP_PASSWORD}" "${KEYS_BACKUP_FILE}.zip" "$KEYS_BACKUP_FILE"
    # remove the unencrypted backup file
    rm "$KEYS_BACKUP_FILE"
}

function restore-keys() {
    echo "[ 📦 --- Restoring Strapi keys and database credentials ]"

    # ask user for the password to decrypt the backup file
    read -sp "Enter the password to decrypt the backup file: " ZIP_PASSWORD
    # unzip the backup file
    unzip -P "${ZIP_PASSWORD}" "${KEYS_BACKUP_FILE}.zip" -d "$(dirname "$KEYS_BACKUP_FILE")"

    if [ ! -f "$KEYS_BACKUP_FILE" ]; then
        echo "Error: Backup file not found at $KEYS_BACKUP_FILE"
        exit 1
    fi

    # updated ENV_FILE defined keys with the backup file values
    while IFS= read -r line; do
        key=$(echo "$line" | cut -d'=' -f1)
        value=$(echo "$line" | cut -d'=' -f2-)
        # Update the ENV_FILE with the new value (macOS-compatible sed command)
        sed -i '' "s|^$key=.*|$key=$value|" "$ENV_FILE"
    done <"$KEYS_BACKUP_FILE"

    # Verify the restoration was successful
    if grep -q "APP_KEYS" "$ENV_FILE"; then
        echo "✅ Keys and database credentials have been restored from $KEYS_BACKUP_FILE"
    else
        echo "❌ Failed to restore the keys."
        exit 1
    fi

    # remove the unencrypted backup file
    rm "$KEYS_BACKUP_FILE"
}

$PHASE && echo "[ ✅ ] --- done" || echo "[ 🚫 ]Failed"
