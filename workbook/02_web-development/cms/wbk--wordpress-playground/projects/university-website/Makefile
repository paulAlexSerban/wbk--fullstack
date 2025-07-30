INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

university-website-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=up --app-name=university-website

university-website-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=down --app-name=university-website

university-website-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=down-clean --app-name=university-website

university-website-backup-db:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=backup-db --app-name=university-website

university-website-restore-db:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=restore-db --app-name=university-website

university-website-clean-install:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=clean-install --app-name=university-website

university-website-list-installed-plugins:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.wordpress.docker-compose.bash --phase=list-installed-plugins --app-name=university-website