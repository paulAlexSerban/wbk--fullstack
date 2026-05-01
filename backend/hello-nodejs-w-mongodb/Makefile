INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-nodejs-w-mongodb-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs-w-mongodb.docker-compose.bash --phase=up --app-name=hello-nodejs-w-mongodb

hello-nodejs-w-mongodb-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs-w-mongodb.docker-compose.bash --phase=down --app-name=hello-nodejs-w-mongodb

hello-nodejs-w-mongodb-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nodejs-w-mongodb.docker-compose.bash --phase=down-clean --app-name=hello-nodejs-w-mongodb
