INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.birthday-buddy.docker-compose.bash --phase=up --app-name=birthday-buddy

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.birthday-buddy.docker-compose.bash --phase=down --app-name=birthday-buddy

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.birthday-buddy.docker-compose.bash --phase=down-clean --app-name=birthday-buddy





compose-up-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.birthday-buddy.docker-compose.bash --phase=up-prod --app-name=birthday-buddy

compose-down-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.birthday-buddy.docker-compose.bash --phase=down-prod --app-name=birthday-buddy

compose-down-clean-prod:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.birthday-buddy.docker-compose.bash --phase=down-clean-prod --app-name=birthday-buddy
