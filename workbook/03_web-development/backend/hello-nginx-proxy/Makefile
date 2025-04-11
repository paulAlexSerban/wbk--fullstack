INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-nginx-proxy-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx-proxy.docker-compose.bash --phase=up --app-name=hello-nginx-proxy

hello-nginx-proxy-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx-proxy.docker-compose.bash --phase=down --app-name=hello-nginx-proxy

hello-nginx-proxy-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx-proxy.docker-compose.bash --phase=down-clean --app-name=hello-nginx-proxy


hello-nginx-proxy-compose-up-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx-proxy.docker-compose.bash --phase=up-prod --app-name=hello-nginx-proxy

hello-nginx-proxy-compose-down-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx-proxy.docker-compose.bash --phase=down-prod --app-name=hello-nginx-proxy

hello-nginx-proxy-compose-down-clean-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nginx-proxy.docker-compose.bash --phase=down-clean-prod --app-name=hello-nginx-proxy