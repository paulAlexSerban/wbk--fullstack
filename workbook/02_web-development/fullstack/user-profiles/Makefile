INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

#########################################################################
# Docker Compose
#########################################################################

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=up --app-name=profiles

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=down --app-name=profiles

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=down-clean --app-name=profiles

compose-make-migrations:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=make-migrations --app-name=profiles

compose-migrate:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=migrate --app-name=profiles

compose-createsuperuser:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=createsuperuser --app-name=profiles

compose-test:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=test --app-name=profiles

compose-lint:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=lint --app-name=profiles	

compose-format:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=format --app-name=profiles

compose-help:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=help --app-name=profiles

compose-start-app:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=start-app --app-name=profiles

#########################################################################
# Content Management
#########################################################################

profiles-backup-db:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=backup-db --app-name=profiles

profiles-restore-db:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=restore-db --app-name=profiles