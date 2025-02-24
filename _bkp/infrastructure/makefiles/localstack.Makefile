# ----------------------------------------------
# Start localstack services
# ----------------------------------------------

define lambda-localstack-compose_template
$(1)-localstack_compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=up --app-name=$(1)

$(1)-localstack_compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=down --app-name=$(1)

$(1)-localstack_compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=down-clean --app-name=$(1)
endef

$(eval $(call lambda-localstack-compose_template,aws-getting-started-with-lambda))
$(eval $(call lambda-localstack-compose_template,hello-lambda))

.PHONY: hello-lambda-localstack_compose-up aws-getting-started-with-lambda-localstack_compose-up \
		hello-lambda-localstack_compose-down aws-getting-started-with-lambda-localstack_compose-down \
		hello-lambda-localstack_compose-down-clean aws-getting-started-with-lambda-localstack_compose-down-clean

hello-lambda-localstack_compose-up: 
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=up --app-name=hello-lambda

aws-getting-started-with-lambda-localstack_compose-up: 
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/lambda.locakstack.docker-compose.bash --phase=up --app-name=aws-getting-started-with-lambda