INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-flask-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.flask.docker-compose.bash --phase=up --app-name=hello-flask

hello-flask-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.flask.docker-compose.bash --phase=down --app-name=hello-flask

hello-flask-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.flask.docker-compose.bash --phase=down-clean --app-name=hello-flask
