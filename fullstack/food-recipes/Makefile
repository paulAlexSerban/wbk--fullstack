INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

#########################################################################
# Docker Compose
#########################################################################

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=up --app-name=recipes

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=down --app-name=recipes

compose-restart-django-api-service:
	@docker restart recipes_django-api-service

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=down-clean --app-name=recipes

compose-make-migrations:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=make-migrations --app-name=recipes

compose-migrate:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=migrate --app-name=recipes

compose-createsuperuser:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=createsuperuser --app-name=recipes

compose-test:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=test --app-name=recipes

compose-lint:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=lint --app-name=recipes

compose-format:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=format --app-name=recipes

compose-help:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=help --app-name=recipes

compose-start-app:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=start-app --app-name=recipes

#########################################################################
# Content Management
#########################################################################

backup-db:
	@bash ./database/scripts/backup.bash --phase=backup-db --app-name=recipes

restore-db:
	@bash ./database/scripts/backup.bash --phase=restore-db --app-name=recipes