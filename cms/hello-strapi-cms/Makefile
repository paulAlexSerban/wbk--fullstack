INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

hello-strapi-cms-compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-strapi-cms.docker-compose.bash --phase=up --app-name=hello-strapi-cms

hello-strapi-cms-compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-strapi-cms.docker-compose.bash --phase=down --app-name=hello-strapi-cms

hello-strapi-cms-compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.hello-strapi-cms.docker-compose.bash --phase=down-clean --app-name=hello-strapi-cms

hello-strapi-cms-backup-db:
	@bash ./tools/backup.bash --phase=backup-db --app-name=hello-strapi-cms

hello-strapi-cms-restore-db:
	@bash ./tools/backup.bash --phase=restore-db --app-name=hello-strapi-cms

hello-strapi-cms-backup-keys:
	@bash ./tools/backup.bash --phase=backup-keys --app-name=hello-strapi-cms

hello-strapi-cms-restore-keys:
	@bash ./tools/backup.bash --phase=restore-keys --app-name=hello-strapi-cms

hello-strapi-cms-backup-uploads:
	@bash ./tools/backup.bash --phase=backup-uploads --app-name=hello-strapi-cms

hello-strapi-cms-restore-uploads:
	@bash ./tools/backup.bash --phase=restore-uploads --app-name=hello-strapi-cms

hello-strapi-cms-backup-all: hello-strapi-cms-backup-db hello-strapi-cms-backup-keys hello-strapi-cms-backup-uploads
	echo "Backup completed."

hello-strapi-cms-restore-all: hello-strapi-cms-restore-db hello-strapi-cms-restore-keys hello-strapi-cms-restore-uploads
	echo "Restore completed."