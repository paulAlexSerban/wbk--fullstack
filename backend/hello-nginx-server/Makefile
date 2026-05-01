INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-nginx-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx.docker-compose.bash --phase=up --app-name=hello-nginx

hello-nginx-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx.docker-compose.bash --phase=down --app-name=hello-nginx

hello-nginx-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx.docker-compose.bash --phase=down-clean --app-name=hello-nginx
