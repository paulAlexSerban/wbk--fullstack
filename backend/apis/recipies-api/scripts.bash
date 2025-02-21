#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

function build() {
    docker-compose build
}

function up() {
    docker-compose up
}

function run-test() {
    docker-compose run --rm app sh -c "flake8"
}

function migrate() {
    docker-compose run --rm app sh -c "python manage.py migrate"
}

# should be run only once to create the project
# function start-django-project() {
#     docker-compose run --rm app sh -c "django-admin startproject app ."
# }
$1