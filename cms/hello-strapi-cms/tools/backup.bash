#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

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

DATABASE_BACKUP_DIR="../database/backup"
KEYS_BACKUP_FILE="${DATABASE_BACKUP_DIR}/keys.env"
ENV_FILE="../infrastructure/configuration/env/.${APP_NAME}.compose.env"
UPLOADS_BACKUP_FILE="uploads.zip"

source ${ENV_FILE}

function save-backup-file() {
    echo "[ 📦 🐳 --- save backup file ]"

    if [ ! -d "${DATABASE_BACKUP_DIR}" ]; then
        mkdir -p ${DATABASE_BACKUP_DIR}
    fi

    if [ -f "${DATABASE_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        cp ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql ${DATABASE_BACKUP_DIR}/${APP_NAME}.$(date +%Y%m%d%H%M%S).sql
    fi
}

function backup-db() {
    echo "[ 📦 🐳 --- backup db ]"
    save-backup-file
    if [ ! -d "${DATABASE_BACKUP_DIR}" ]; then
        mkdir -p ${DATABASE_BACKUP_DIR}
    fi

    if [ ! -f "${DATABASE_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        echo "Backup file not found at ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql --> creating an empty one"
        touch ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql
    fi

    docker exec -it ${APP_NAME}-postgresql-database-1 pg_dump -U ${DATABASE_USERNAME} --inserts ${DATABASE_NAME} >${DATABASE_BACKUP_DIR}/${APP_NAME}.sql
}

function restore-db() {
    echo "[ 📦 🐳 --- restore db ]"
    docker stop ${APP_NAME}

    if [ ! -d "${DATABASE_BACKUP_DIR}" ]; then
        echo "Error: Backup directory not found at ${DATABASE_BACKUP_DIR}"
        exit 1
    fi
    if [ ! -f "${DATABASE_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        echo "Error: Backup file not found at ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql"
        exit 1
    fi

    docker exec -i ${APP_NAME}-postgresql-database-1 psql -U ${DATABASE_USERNAME} -d ${DATABASE_NAME} <${DATABASE_BACKUP_DIR}/${APP_NAME}.sql
    docker start ${APP_NAME}
}

function backup-uploads() {
    echo "[ 📦 🐳 --- backup uploads ]"
    BACK_PATH=$(pwd)
    PUBLIC_UPLOADS_DIR="../${CMS_PROJECT_PATH}/public/uploads"

    if [ ! -d "${PUBLIC_UPLOADS_DIR}" ]; then
        echo "Error: Uploads directory not found at ${PUBLIC_UPLOADS_DIR}"
        exit 1
    fi
    cd $PUBLIC_UPLOADS_DIR

    zip -r ${UPLOADS_BACKUP_FILE} ./*
    cd $BACK_PATH

    TMP_UPLOADS_BACKUP_PATH="../${CMS_PROJECT_PATH}/public/uploads/${UPLOADS_BACKUP_FILE}"
    if [ -f $TMP_UPLOADS_BACKUP_PATH ]; then
        echo "✅ Uploads have been backed up to ${UPLOADS_BACKUP_FILE}"
    else
        echo "❌ Failed to create the uploads backup file."
        exit 1
    fi

    mv ${TMP_UPLOADS_BACKUP_PATH} ${DATABASE_BACKUP_DIR}
}

function restore-uploads() {
    echo "[ 📦 🐳 --- restore uploads ]"
    UPLOADS_BACKUP_PATH=${DATABASE_BACKUP_DIR}/${UPLOADS_BACKUP_FILE}
    PUBLIC_UPLOADS_DIR="../${CMS_PROJECT_PATH}/public/uploads"

    if [ ! -f $UPLOADS_BACKUP_PATH ]; then
        echo "Error: Uploads backup file not found at ${UPLOADS_BACKUP_FILE}"
        exit 1
    fi

    unzip -o "${UPLOADS_BACKUP_PATH}" -d "$PUBLIC_UPLOADS_DIR"
}

function backup-keys() {
    echo "[ 📦 --- Backing up Strapi keys and database credentials ]"

    if [ ! -f "$ENV_FILE" ]; then
        echo "Error: Environment file not found at $ENV_FILE"
        exit 1
    fi

    # Extract the required keys and database credentials
    grep -E "^(APP_KEYS|API_TOKEN_SALT|ADMIN_JWT_SECRET|TRANSFER_TOKEN_SALT|JWT_SECRET|DATABASE_CLIENT|DATABASE_HOST|DATABASE_PORT|DATABASE_NAME|DATABASE_USERNAME|DATABASE_PASSWORD)" "$ENV_FILE" >"${KEYS_BACKUP_FILE}"

    # Verify the backup file was created
    if [ -f "${KEYS_BACKUP_FILE}" ]; then
        echo "✅ Keys and database credentials have been backed up to ${KEYS_BACKUP_FILE}"
    else
        echo "❌ Failed to create the keys backup file."
        exit 1
    fi

    # ask user for a password to encrypt the backup file
    read -sp "Enter a password to encrypt the backup file: " ZIP_PASSWORD
    # zip and encrypt the backup file
    zip -P "${ZIP_PASSWORD}" -j "${KEYS_BACKUP_FILE}.zip" "${KEYS_BACKUP_FILE}"
    # remove the unencrypted backup file
    rm "${KEYS_BACKUP_FILE}"
}

function restore-keys() {
    echo "[ 📦 --- Restoring Strapi keys and database credentials ]"

    # ask user for the password to decrypt the backup file
    read -sp "Enter the password to decrypt the backup file: " ZIP_PASSWORD
    # unzip the backup file
    unzip -P "${ZIP_PASSWORD}" "${KEYS_BACKUP_FILE}.zip" -d "$(dirname "${KEYS_BACKUP_FILE}")"

    if [ ! -f "${KEYS_BACKUP_FILE}" ]; then
        echo "Error: Backup file not found at ${KEYS_BACKUP_FILE}"
        exit 1
    fi

    # updated ENV_FILE defined keys with the backup file values
    while IFS= read -r line; do
        key=$(echo "$line" | cut -d'=' -f1)
        value=$(echo "$line" | cut -d'=' -f2-)
        sed -i '' "s|^$key=.*|$key=$value|" "$ENV_FILE"
    done <"${KEYS_BACKUP_FILE}"

    # Verify the restoration was successful
    if grep -q "APP_KEYS" "$ENV_FILE"; then
        echo "✅ Keys and database credentials have been restored from ${KEYS_BACKUP_FILE}"
    else
        echo "❌ Failed to restore the keys."
        exit 1
    fi

    # remove the unencrypted backup file
    rm "${KEYS_BACKUP_FILE}"
}

$PHASE && echo "[ ✅ ] --- done" || echo "[ 🚫 ]Failed"
