INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

basic-store-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.flask.docker-compose.bash --phase=up --app-name=basic-store

basic-store-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.flask.docker-compose.bash --phase=down --app-name=basic-store

basic-store-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.flask.docker-compose.bash --phase=down-clean --app-name=basic-store

basic-store-lint:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.flask.docker-compose.bash --phase=lint --app-name=basic-store

basic-store-foramt:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.flask.docker-compose.bash --phase=format --app-name=basic-store