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

dj-events-backup-db:
	@bash ./tools/backup.bash --phase=backup-db --app-name=dj-events

dj-events-restore-db:
	@bash ./tools/backup.bash --phase=restore-db --app-name=dj-events

dj-events-backup-keys:
	@bash ./tools/backup.bash --phase=backup-keys --app-name=dj-events

dj-events-restore-keys:
	@bash ./tools/backup.bash --phase=restore-keys --app-name=dj-events

dj-events-backup-uploads:
	@bash ./tools/backup.bash --phase=backup-uploads --app-name=dj-events

dj-events-restore-uploads:
	@bash ./tools/backup.bash --phase=restore-uploads --app-name=dj-events

dj-events-backup-all: dj-events-backup-db dj-events-backup-keys dj-events-backup-uploads
	echo "Backup completed."

dj-events-restore-all: dj-events-restore-db dj-events-restore-keys dj-events-restore-uploads
	echo "Restore completed."