INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-strapi-cms-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-strapi-cms.docker-compose.bash --phase=up --app-name=hello-strapi-cms

hello-strapi-cms-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-strapi-cms.docker-compose.bash --phase=down --app-name=hello-strapi-cms

hello-strapi-cms-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-strapi-cms.docker-compose.bash --phase=down-clean --app-name=hello-strapi-cms
