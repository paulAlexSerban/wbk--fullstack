INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

# ----------------------------------------------
# Base Nodej.js compose
# ----------------------------------------------

define base-nodejs-compose_template
$(1)-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs.docker-compose.bash --phase=up --app-name=$(1)

$(1)-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs.docker-compose.bash --phase=down --app-name=$(1)

$(1)-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs.docker-compose.bash --phase=down-clean --app-name=$(1)

$(1)-backup-db:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs.docker-compose.bash --phase=backup-db --app-name=$(1)

$(1)-restore-db:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs.docker-compose.bash --phase=restore-db --app-name=$(1)
endef

$(eval $(call base-nodejs-compose_template,hello-nodejs))

.PHONY: hello-nodejs-compose-up hello-nodejs-compose-down hello-nodejs-compose-down-clean

hello-nodejs-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs.docker-compose.bash --phase=up --app-name=hello-nodejs