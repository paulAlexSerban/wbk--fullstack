INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.color-generator.docker-compose.bash --phase=up --app-name=color-generator

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.color-generator.docker-compose.bash --phase=down --app-name=color-generator

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.color-generator.docker-compose.bash --phase=down-clean --app-name=color-generator





compose-up-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.color-generator.docker-compose.bash --phase=up-prod --app-name=color-generator

compose-down-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.color-generator.docker-compose.bash --phase=down-prod --app-name=color-generator

compose-down-clean-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.color-generator.docker-compose.bash --phase=down-clean-prod --app-name=color-generator
