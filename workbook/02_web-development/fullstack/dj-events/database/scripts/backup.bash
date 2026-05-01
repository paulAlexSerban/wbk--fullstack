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

DATABASE_BACKUP_DIR="../backup"
ENV_FILE="../../infrastructure/configuration/env/.${APP_NAME}.compose.env"
CONTENT_DATA_DATABASE_DIR="../../content/data/database"

source ${ENV_FILE}

function backup-db-data() {
    echo "[ 📦 🐳 --- save backup file ]"

    if [ ! -d "${DATABASE_BACKUP_DIR}" ]; then
        mkdir -p ${DATABASE_BACKUP_DIR}
    fi

    if [ -f "${DATABASE_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        echo "Backup file already exists at ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql --> creating a backup file"
        cp ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql ${DATABASE_BACKUP_DIR}/${APP_NAME}.$(date +%Y%m%d%H%M%S).sql.bak
        echo "Backup file created at ${DATABASE_BACKUP_DIR}/${APP_NAME}.$(date +%Y%m%d%H%M%S).sql.bak"
    fi
}

function export-db-data() {
    echo "[ 📦 🐳 --- export-db-data ]"
    if [ ! -d "${DATABASE_BACKUP_DIR}" ]; then
        mkdir -p ${DATABASE_BACKUP_DIR}
    fi
    if [ ! -f "${DATABASE_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        echo "Backup file not found at ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql --> creating an empty one"
        touch ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql
    fi

    docker exec -it ${APP_NAME}_postgresql-database pg_dump -U ${DATABASE_USERNAME} --inserts ${DATABASE_NAME} >${DATABASE_BACKUP_DIR}/${APP_NAME}.sql
}

function save-for-content-package() {
    if [ ! -d "${CONTENT_DATA_DATABASE_DIR}" ]; then
        mkdir -p ${CONTENT_DATA_DATABASE_DIR}
    fi

    if [ ! -f "${DATABASE_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        echo "Database backup file not found at ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql"
    fi

    cp ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql ${CONTENT_DATA_DATABASE_DIR}/${APP_NAME}.sql
}

function restore-from-content-package() {
    if [ ! -f "${CONTENT_DATA_DATABASE_DIR}/${APP_NAME}.sql" ]; then
        echo "Database backup file not found at ${CONTENT_DATA_DATABASE_DIR}/${APP_NAME}.sql"
        exit 1
    fi

    cp ${CONTENT_DATA_DATABASE_DIR}/${APP_NAME}.sql ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql
}

function backup-db() {
    export-db-data
    backup-db-data
    save-for-content-package
}

function restore-db() {
    echo "[ 📦 🐳 --- restore db ]"
    docker stop ${APP_NAME} > /dev/null 2>&1

    if [ ! -f "${DATABASE_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        echo "Restoring from content package"
        restore-from-content-package
    fi

    docker exec -i ${APP_NAME}_postgresql-database psql -U ${DATABASE_USERNAME} -d ${DATABASE_NAME} <${DATABASE_BACKUP_DIR}/${APP_NAME}.sql > /dev/null 2>&1
    docker start ${APP_NAME} > /dev/null 2>&1
}

$PHASE && echo "[ ✅ ] --- done" || echo "[ 🚫 ]Failed"
