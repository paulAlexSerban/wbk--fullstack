#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit


function lint() {
    flake8
}

function auto-format() {
    autopep8 --in-place --aggressive --aggressive \$(find . -name '*.py' -not -path './venv/*')
}

function run-migrate() {
    python manage.py migrate
}

function run-test() {
    python manage.py test apps
}

# should be run only once to create the project
# function start-django-project() {
#     django-admin startproject app .
# }

function start-django-app() {
    python manage.py startapp core
}

function wait-for-db() {
    python manage.py wait_for_db && flake8
}

$1