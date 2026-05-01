INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.redux-counter.docker-compose.bash --phase=up --app-name=redux-counter

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.redux-counter.docker-compose.bash --phase=down --app-name=redux-counter

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.redux-counter.docker-compose.bash --phase=down-clean --app-name=redux-counter





compose-up-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.redux-counter.docker-compose.bash --phase=up-prod --app-name=redux-counter

compose-down-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.redux-counter.docker-compose.bash --phase=down-prod --app-name=redux-counter

compose-down-clean-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.redux-counter.docker-compose.bash --phase=down-clean-prod --app-name=redux-counter
