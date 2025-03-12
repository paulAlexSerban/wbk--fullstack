# ------------------------------------------------------------- #
# (compose): DevCamper
# ------------------------------------------------------------- #
devcamper_compose-up:
	@bash $(DEVELOP_COMPOSE_SCRIPTS)/devcamper-compose.bash up

devcamper_compose-up-prod:
	@bash $(DEVELOP_COMPOSE_SCRIPTS)/devcamper-compose.bash up-prod

devcamper_compose-down:
	@bash $(DEVELOP_COMPOSE_SCRIPTS)/devcamper-compose.bash down

devcamper_compose-down-prod:
	@bash $(DEVELOP_COMPOSE_SCRIPTS)/devcamper-compose.bash down-prod

# ------------------------------------------------------------- #
# (image): DevCamper API
# ------------------------------------------------------------- #
devcamper-api-image_build:
	@bash $(DOCKER_IMAGE_SCRIPTS)/devcamper-api.bash build

devcamper-api-image_build-prod:
	@bash $(DOCKER_IMAGE_SCRIPTS)/devcamper-api.bash build-prod

devcamper-api-image_run:
	@bash $(DOCKER_IMAGE_SCRIPTS)/devcamper-api.bash run

devcamper-api-image_run-prod:
	@bash $(DOCKER_IMAGE_SCRIPTS)/devcamper-api.bash run-prod

devcamper-api-image_stop:
	@bash $(DOCKER_IMAGE_SCRIPTS)/devcamper-api.bash stop

devcamper-api-image_clean:
	@bash $(DOCKER_IMAGE_SCRIPTS)/devcamper-api.bash clean