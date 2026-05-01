INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

devcamper-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/devcamper.docker-compose.bash --phase=up --app-name=devcamper

devcamper-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/devcamper.docker-compose.bash --phase=down --app-name=devcamper

devcamper-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/devcamper.docker-compose.bash --phase=down-clean --app-name=devcamper