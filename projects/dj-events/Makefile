INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

#########################################################################
# Docker Compose
#########################################################################

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=up --app-name=dj-events
	@echo "If freshly build, run the following command to seed the database and upload static assets:"
	@echo "  make dj-events-restore-all"

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=down --app-name=dj-events

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=down-clean --app-name=dj-events
	@docker volume rm $(docker volume ls -q)

compose-restart-ssr-service:
	@docker restart dj-events-nextjs-ssr-service-1
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=logs --app-name=dj-events

compose-rebuild-strapi-cms:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=rebuild-strapi-cms --app-name=dj-events

#########################################################################
# Content Management
#########################################################################

upload-static-assets:
	@bash ./backend/storage/dj-events-static-storage/src/upload.bash

backup-db:
	@bash ./database/scripts/backup.bash --phase=backup-db --app-name=dj-events

restore-db:
	@bash ./database/scripts/backup.bash --phase=restore-db --app-name=dj-events

backup-keys:
	@bash ./content/scripts/backup.bash --phase=backup-keys --app-name=dj-events

restore-keys:
	@bash ./content/scripts/backup.bash --phase=restore-keys --app-name=dj-events

backup-server-assets:
	@bash ./content/scripts/backup.bash --phase=backup-server-assets --app-name=dj-events

restore-server-assets:
	@bash ./content/scripts/backup.bash --phase=restore-server-assets --app-name=dj-events

backup-cloud-s3-assets:
	@bash ./content/scripts/backup.bash --phase=backup-cloud-s3-assets --app-name=dj-events

restore-cloud-s3-assets:
	@bash ./content/scripts/backup.bash --phase=restore-cloud-s3-assets --app-name=dj-events

clean-tmp-data:
	@bash ./content/scripts/backup.bash --phase=clean-tmp-data --app-name=dj-events

save-content: backup-db backup-keys backup-server-assets backup-cloud-s3-assets 
	@echo "[ ✅ ] Content saved"

save-content-clean: save-content clean-tmp-data
	@echo "[ ✅ ] Content saved and ./tmp-data cleaned"

restore-content: restore-db restore-keys restore-server-assets restore-cloud-s3-assets upload-static-assets
	@echo "[ ✅ ] Content restored"