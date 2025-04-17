INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

dj-events-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=up --app-name=dj-events
	@echo "If freshly build, run the following command to seed the database and upload static assets:"
	@echo "  make dj-events-restore-all"

dj-events-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=down --app-name=dj-events

dj-events-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.dj-events.docker-compose.bash --phase=down-clean --app-name=dj-events
	@docker volume rm $(docker volume ls -q)

dj-events-restart-ssr-service:
	@docker restart dj-events-nextjs-ssr-service-1

dj-events-upload-static-assets:
	@bash ./backend/storage/dj-events-static-storage/src/upload.bash

dj-events-backup-db:
	@bash ./database/scripts/backup.bash --phase=backup-db --app-name=dj-events

dj-events-restore-db:
	@bash ./database/scripts/backup.bash --phase=restore-db --app-name=dj-events

dj-events-backup-keys:
	@bash ./content/scripts/backup.bash --phase=backup-keys --app-name=dj-events

dj-events-restore-keys:
	@bash ./content/scripts/backup.bash --phase=restore-keys --app-name=dj-events

dj-events-backup-server-assets:
	@bash ./content/scripts/backup.bash --phase=backup-server-assets --app-name=dj-events

dj-events-restore-server-assets:
	@bash ./content/scripts/backup.bash --phase=restore-server-assets --app-name=dj-events

dj-events-backup-cloud-s3-assets:
	@bash ./content/scripts/backup.bash --phase=backup-cloud-s3-assets --app-name=dj-events

dj-events-restore-cloud-s3-assets:
	@bash ./content/scripts/backup.bash --phase=restore-cloud-s3-assets --app-name=dj-events

dj-events-save-content: dj-events-backup-db dj-events-backup-keys dj-events-backup-server-assets dj-events-backup-cloud-s3-assets
	@echo "[ ✅ ] Content saved"

dj-events-restore-content: dj-events-restore-db dj-events-restore-keys dj-events-restore-server-assets dj-events-restore-cloud-s3-assets dj-events-upload-static-assets
	@echo "[ ✅ ] Content restored"