INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.blogpost-gallery.docker-compose.bash --phase=up --app-name=blogpost-gallery

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.blogpost-gallery.docker-compose.bash --phase=down --app-name=blogpost-gallery

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.blogpost-gallery.docker-compose.bash --phase=down-clean --app-name=blogpost-gallery





compose-up-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.blogpost-gallery.docker-compose.bash --phase=up-prod --app-name=blogpost-gallery

compose-down-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.blogpost-gallery.docker-compose.bash --phase=down-prod --app-name=blogpost-gallery

compose-down-clean-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.blogpost-gallery.docker-compose.bash --phase=down-clean-prod --app-name=blogpost-gallery
