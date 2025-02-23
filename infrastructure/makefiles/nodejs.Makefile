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
endef

$(eval $(call base-nodejs-compose_template,hello-nodejs))
$(eval $(call base-nodejs-compose_template,monsters))

.PHONY: monsters-compose-up monsters-compose-down monsters-compose-down-clean

monsters-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs.docker-compose.bash --phase=up --app-name=monsters