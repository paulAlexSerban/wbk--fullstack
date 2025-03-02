INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-wordpress-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=up --app-name=hello-wordpress

hello-wordpress-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=down --app-name=hello-wordpress

hello-wordpress-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=down-clean --app-name=hello-wordpress

hello-wordpress-backup-db:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=backup-db --app-name=hello-wordpress

hello-wordpress-restore-db:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=restore-db --app-name=hello-wordpress

hello-wordpress-clean-install:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=clean-install --app-name=hello-wordpress