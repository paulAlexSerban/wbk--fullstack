INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker
INFRA_PROVISIONING_SCRIPTS := ./infrastructure/provisioning/scripts

define lambda-localstack-compose_template
$(1)-localstack_compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=up --app-name=$(1)

$(1)-localstack_compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=down --app-name=$(1)

$(1)-localstack_compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=down-clean --app-name=$(1)
endef

$(eval $(call lambda-localstack-compose_template,hello-lambda))

hello-lambda-localstack_compose-up: 
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=up --app-name=hello-lambda

define localstack-lambda-template
$(1)_localstack-build:
	@bash $(INFRA_PROVISIONING_SCRIPTS)/$(1).localstack.bash --phase=build --app-name=$(1)

$(1)_localstack-deploy:
	@bash $(INFRA_PROVISIONING_SCRIPTS)/$(1).localstack.bash --phase=deploy --app-name=$(1)
endef

$(eval $(call localstack-lambda-template,hello-lambda))

hello-lambda_localstack-build:
	@bash $(INFRA_PROVISIONING_SCRIPTS)/hello-lambda.localstack.bash --phase=build --app-name=hello-lambda
