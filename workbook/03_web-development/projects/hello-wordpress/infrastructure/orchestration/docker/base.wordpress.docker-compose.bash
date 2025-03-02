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
COMPOSE_FILE_DEV="./base.wordpress.docker-compose.yml"
COMPOSE_FILE_PROD=""

source ${ENV_FILE}

DATABASE_BACKUP_DIR="../../../database/backup"

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
}

function logs() {
    echo "[ 📜 🐳 --- compose logs ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} logs --follow
}

function save-backup-file() {
    echo "[ 📦 🐳 --- save backup file ]"
    if [ -f "${DATABASE_BACKUP_DIR}/${APP_NAME}.sql" ]; then
        cp ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql ${DATABASE_BACKUP_DIR}/${APP_NAME}.$(date +%Y%m%d%H%M%S).sql
    fi
}

function backup-db() {
    echo "[ 📦 🐳 --- backup db ]"
    save-backup-file
    mkdir -p ${DATABASE_BACKUP_DIR}/
    docker exec -it ${APP_NAME}_database mariadb-dump -u${DATABASE_USER} -p${DATABASE_PASSWORD} ${COMPOSE_PROJECT_NAME} > ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql
}

# function restore-db() {
#     echo "[ 📦 🐳 --- restore db ]"
#     docker exec -i ${APP_NAME}-database psql -U ${DATABASE_USER} ${DB_NAME} < ${DATABASE_BACKUP_DIR}/${APP_NAME}.sql
# }

function help() {
    echo "Available commands:"
    echo "  list: list the containers"
    echo "  up: start the containers"
    echo "  down: stop the containers"
    echo "  down-clean: stop the containers and remove the volumes and images"
    echo "  logs: show the logs"
}

$PHASE && echo "[ ✅ ] --- done" || echo "[ 🚫 ]Failed"
