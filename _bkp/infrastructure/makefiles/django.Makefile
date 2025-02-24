# ----------------------------------------------
# Base Django compose
# ----------------------------------------------
define base-django-compose_template
$(1)-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=up --app-name=$(1)

$(1)-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=down --app-name=$(1)

$(1)-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=down-clean --app-name=$(1)

$(1)-compose-make-migrations:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=make-migrations --app-name=$(1)

$(1)-compose-migrate:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=migrate --app-name=$(1)

$(1)-compose-createsuperuser:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=createsuperuser --app-name=$(1)

$(1)-compose-test:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=test --app-name=$(1)

$(1)-compose-lint:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=lint --app-name=$(1)

$(1)-compose-format:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=format --app-name=$(1)

$(1)-compose-help:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=help --app-name=$(1)

$(1)-compose-start-app:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=start-app --app-name=$(1)
endef

$(eval $(call base-django-compose_template,hello-django))
$(eval $(call base-django-compose_template,profiles))
$(eval $(call base-django-compose_template,recipes))

.PHONY: hello-django-compose-up profiles-compose-up recipes-compose-up \
		hello-django-compose-down profiles-compose-down recipes-compose-down \
		hello-django-compose-down-clean profiles-compose-down-clean recipes-compose-down-clean \
		hello-django-compose-make-migrations profiles-compose-make-migrations recipes-compose-make-migrations \
		hello-django-compose-migrate profiles-compose-migrate recipes-compose-migrate \
		hello-django-compose-createsuperuser profiles-compose-createsuperuser recipes-compose-createsuperuser

hello-django-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=up --app-name=hello-django

profiles-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.django.docker-compose.bash --phase=up --app-name=profiles