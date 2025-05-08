INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-react-w-vite.docker-compose.bash --phase=up --app-name=hello-react-w-vite

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-react-w-vite.docker-compose.bash --phase=down --app-name=hello-react-w-vite

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-react-w-vite.docker-compose.bash --phase=down-clean --app-name=hello-react-w-vite





compose-up-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-react-w-vite.docker-compose.bash --phase=up-prod --app-name=hello-react-w-vite

compose-down-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-react-w-vite.docker-compose.bash --phase=down-prod --app-name=hello-react-w-vite

compose-down-clean-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-react-w-vite.docker-compose.bash --phase=down-clean-prod --app-name=hello-react-w-vite
