INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-payload-cms-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-payload-cms.docker-compose.bash --phase=up --app-name=hello-payload-cms

hello-payload-cms-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-payload-cms.docker-compose.bash --phase=down --app-name=hello-payload-cms

hello-payload-cms-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-payload-cms.docker-compose.bash --phase=down-clean --app-name=hello-payload-cms
