INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

# ----------------------------------------------
# Base Django compose
# ----------------------------------------------
.PHONY: recipes-compose-up \
		recipes-compose-down \
		recipes-compose-down-clean \
		recipes-compose-make-migrations \
		recipes-compose-migrate \
		recipes-compose-createsuperuser

recipes-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=up --app-name=recipes

recipes-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=down --app-name=recipes

recipes-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=down-clean --app-name=recipes

recipes-compose-make-migrations:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=make-migrations --app-name=recipes

recipes-compose-migrate:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=migrate --app-name=recipes

recipes-compose-createsuperuser:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=createsuperuser --app-name=recipes

recipes-compose-test:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=test --app-name=recipes

recipes-compose-lint:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=lint --app-name=recipes

recipes-compose-format:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=format --app-name=recipes

recipes-compose-help:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=help --app-name=recipes

recipes-compose-start-app:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=start-app --app-name=recipes