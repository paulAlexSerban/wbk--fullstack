INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

dj-events-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=up --app-name=dj-events

dj-events-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=down --app-name=dj-events

dj-events-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=down-clean --app-name=dj-events

dj-events-restart-ssr-service:
	@docker restart dj-events-nextjs-ssr-service-1

dj-events-upload-static-assets:
	@bash ./backend/storage/dj-events-storage/src/upload.bash