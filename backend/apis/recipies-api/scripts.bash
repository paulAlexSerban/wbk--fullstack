#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

function build() {
    docker-compose build
}

function up() {
    docker-compose up
}

function run-lint() {
    docker-compose run --rm app sh -c "flake8"
}

function run-autopep8() {
    docker-compose run --rm app sh -c "autopep8 --in-place --aggressive --aggressive \$(find . -name '*.py' -not -path './venv/*')"
}

function run-migrate() {
    docker-compose run --rm app sh -c "python manage.py migrate"
}

function run-test() {
    docker-compose run --rm app sh -c "python manage.py test"
}

# should be run only once to create the project
# function start-django-project() {
#     docker-compose run --rm app sh -c "django-admin startproject app ."
# }

$1