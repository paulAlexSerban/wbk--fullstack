INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.solid-in-react.docker-compose.bash --phase=up --app-name=solid-in-react

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.solid-in-react.docker-compose.bash --phase=down --app-name=solid-in-react

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.solid-in-react.docker-compose.bash --phase=down-clean --app-name=solid-in-react





compose-up-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.solid-in-react.docker-compose.bash --phase=up-prod --app-name=solid-in-react

compose-down-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.solid-in-react.docker-compose.bash --phase=down-prod --app-name=solid-in-react

compose-down-clean-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.solid-in-react.docker-compose.bash --phase=down-clean-prod --app-name=solid-in-react
