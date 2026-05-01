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

DB_BACKUP_DIR="../backup"
ENV_FILE="../../infrastructure/configuration/env/.${APP_NAME}.compose.env"
CONTENT_DATA_DB_DIR="../../content/data/database"

source ${ENV_FILE}

function backup-db-data() {
    echo "[ 📦 🐳 --- save backup file ]"

    if [ ! -d "${DB_BACKUP_DIR}" ]; then
        mkdir -p ${DB_BACKUP_DIR}
    fi

    if [ -f "${DB_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        echo "Backup file already exists at ${DB_BACKUP_DIR}/${APP_NAME}.sql --> creating a backup file"
        cp ${DB_BACKUP_DIR}/${APP_NAME}.sql ${DB_BACKUP_DIR}/${APP_NAME}.$(date +%Y%m%d%H%M%S).sql.bak
        echo "Backup file created at ${DB_BACKUP_DIR}/${APP_NAME}.$(date +%Y%m%d%H%M%S).sql.bak"
    fi
}

function export-db-data() {
    echo "[ 📦 🐳 --- export-db-data ]"
    if [ ! -d "${DB_BACKUP_DIR}" ]; then
        mkdir -p ${DB_BACKUP_DIR}
    fi
    if [ ! -f "${DB_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        echo "Backup file not found at ${DB_BACKUP_DIR}/${APP_NAME}.sql --> creating an empty one"
        touch ${DB_BACKUP_DIR}/${APP_NAME}.sql
    fi

    docker exec -it ${APP_NAME}_postgresql_database pg_dump -U ${DB_USERNAME} --inserts ${DB_NAME} >${DB_BACKUP_DIR}/${APP_NAME}.sql
}

function backup-db() {
    export-db-data
    backup-db-data
}

function restore-db() {
    echo "[ 📦 🐳 --- restore db ]"
    docker stop ${APP_NAME}_django-api-service > /dev/null 2>&1
    docker exec -i ${APP_NAME}_postgresql_database psql -U ${DB_USERNAME} -d ${DB_NAME} <${DB_BACKUP_DIR}/${APP_NAME}.sql
    docker start ${APP_NAME}_django-api-service  > /dev/null 2>&1
}

$PHASE && echo "[ ✅ ] --- done" || echo "[ 🚫 ]Failed"
