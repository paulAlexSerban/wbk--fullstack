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
COMPOSE_FILE_DEV="./base.django.docker-compose.yml"
COMPOSE_FILE_PROD=""


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
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} down --volumes --rmi all
    list
}

function logs() {
    echo "[ 📜 🐳 --- compose logs ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} logs --follow
}

# # uncomment this function if you want to use it
# function make-migrations() {
#     # use this command to create the migration files after creating a new model
#     APP_MIGRATION_NAME=profiles_api # change this to the app name
#     echo "[ 🟢 🐳 --- compose make migrations for django ]"
#     docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
#                    -c "python manage.py makemigrations ${APP_MIGRATION_NAME}"
# }

function migrate() {
    # use this command to apply the migration files to the database after you run make-migrations
    echo "[ 🟢 🐳 --- compose migrate ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "python manage.py migrate"
}
function createsuperuser() {
    # use this command to create a superuser
    echo
    echo "[ 🟢 🐳 --- compose createsuperuser ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "python manage.py createsuperuser --noinput --email admin@example.com --name admin --force-color"
        docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "echo \"from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(name='admin'); user.set_password('admin'); user.save()\" | python manage.py shell"
}

function help() {
    echo "Available commands:"
    echo "  up - start the Docker container"
    echo "  down - stop the Docker container"
    echo "  logs - show the logs of the Docker container"
    echo "  list - list the containers"
    echo "  help - show this help"
}

$PHASE && echo "[ ✅ ] --- done" || echo "[ 🚫 ]Failed"
