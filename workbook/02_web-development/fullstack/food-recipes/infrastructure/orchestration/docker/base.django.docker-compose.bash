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

# uncomment this function if you want to use it
function make-migrations() {
    # STEP 1: use this command to create the migration files after creating a new model
    APP_MIGRATION_NAME=core # change this to the app name
    echo "[ 🟢 🐳 --- compose make migrations for django ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "python manage.py makemigrations ${APP_MIGRATION_NAME}"
}

function migrate() {
    # STEP 2: use this command to apply the migration files to the database after you run make-migrations
    echo "[ 🟢 🐳 --- compose migrate ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "python manage.py migrate"
}

function createsuperuser() {
    # use this command to create a superuser
    echo
    echo "[ 🟢 🐳 --- compose createsuperuser ]"
    # create the superuser via the command line
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "python manage.py createsuperuser --noinput --email admin@example.com --force-color"

    # set the password for the superuser
    # this is a workaround to set the password for the superuser
    # because the createsuperuser command does not allow to set the password
    # via the command line
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                -c "echo \"from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(email='admin@example.com'); user.set_password('admin'); user.save()\" | python manage.py shell"

    # IMPORTANT:
    # make sure to use same user identifier
    # in the CLI command above and in the shell command below
    # the CLI uses the email as identifier as it was the new model created
    # the shell command uses the email as identifier as it was the new model created
    # default model uses username/user as identifier

}

function test() {
    # use this command to run the tests
    echo "[ 🟢 🐳 --- compose test ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "python manage.py test apps"
}

# # uncomment this function if you want to use it
# # use this command to start a new Django project
# function start-project() {
#     # use this command to start a new Django project
#     echo "[ 🟢 🐳 --- compose startproject ]"
#     docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
#                    -c "django-admin startproject app ."
# }

# # uncomment this function if you want to use it
# # use this command to start a new Django app
# function start-app() {
#     # use this command to start a new Django app
#     NEW_DJANGO_APP_NAME="hello_api"
#     echo "[ 🟢 🐳 --- compose startapp ]"
#     docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
#                    -c "mkdir apps/${NEW_DJANGO_APP_NAME}"
#     docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
#                    -c "python manage.py startapp ${NEW_DJANGO_APP_NAME} apps/${NEW_DJANGO_APP_NAME}"
# }

function lint() {
    # use this command to lint the code
    echo "[ 🟢 🐳 --- compose lint ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "flake8"
}

function format() {
    # use this command to format the code
    echo "[ 🟢 🐳 --- compose format ]"
    docker compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE_DEV} run --rm django-api-service sh \
                   -c "autopep8 --in-place --aggressive --aggressive \$(find . -name '*.py' -not -path './venv/*')"
}

function help() {
    echo "Available commands:"
    echo "  up - start the Docker container"
    echo "  down - stop the Docker container"
    echo "  down-clean - stop the Docker container and remove the volumes and images"
    echo "  logs - show the logs of the Docker container"
    echo "  list - list the containers"
    echo "  migrate - apply the migrations to the database"
    echo "  createsuperuser - create a superuser"
    echo "  test - run the tests"
    echo "  lint - lint the code"
    echo "  format - format the code"
    echo "  help - show this help"
}

$PHASE && echo "[ ✅ ] --- done" || echo "[ 🚫 ]Failed"
