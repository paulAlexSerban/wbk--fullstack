INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-reactjs-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-reactjs.docker-compose.bash --phase=up --app-name=hello-reactjs

hello-reactjs-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-reactjs.docker-compose.bash --phase=down --app-name=hello-reactjs

hello-reactjs-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-reactjs.docker-compose.bash --phase=down-clean --app-name=hello-reactjs





hello-reactjs-compose-up-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-reactjs.docker-compose.bash --phase=up-prod --app-name=hello-reactjs

hello-reactjs-compose-down-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-reactjs.docker-compose.bash --phase=down-prod --app-name=hello-reactjs

hello-reactjs-compose-down-clean-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-reactjs.docker-compose.bash --phase=down-clean-prod --app-name=hello-reactjs
