INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.fastapi.docker-compose.bash --phase=up --app-name=hello-fastapi

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.fastapi.docker-compose.bash --phase=down --app-name=hello-fastapi

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.fastapi.docker-compose.bash --phase=down-clean --app-name=hello-fastapi
