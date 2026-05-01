INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR := ./infrastructure/orchestration/docker

compose-up:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nextjs.docker-compose.bash --phase=up --app-name=hello-nextjs-w-shadcn

compose-down:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nextjs.docker-compose.bash --phase=down --app-name=hello-nextjs-w-shadcn

compose-down-clean:
	@bash $(INFRA_ORCHESTRATION_SCRIPTS_DOCKER_DIR)/base.nextjs.docker-compose.bash --phase=down-clean --app-name=hello-nextjs-w-shadcn
