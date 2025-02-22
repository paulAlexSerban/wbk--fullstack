INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker
INFRA_PROVISIONING_SCRIPTS := ./infrastructure/provisioning/scripts
INFRA_SERVER_TEMPLATING_DOCKER_SCRIPTS := ./infrastructure/server-templating/docker
INFRA_PROVISIONING_TERRAFORM_DIR := ./infrastructure/provisioning/terraform

include infrastructure/makefiles/django.Makefile
include infrastructure/makefiles/lambda.Makefile
include infrastructure/makefiles/localstack.Makefile
