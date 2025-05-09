hello-directus-cms-compose-up:
	@echo "Starting up the Directus CMS project using Docker Compose..."
	@docker compose -f docker-compose.yml up -d
	@echo "Directus CMS is now running. You can access it at http://localhost:8055"
	@echo "To stop the services, run 'make hello-directus-cms-compose-down'"

hello-directus-cms-compose-down:
	@echo "Stopping the Directus CMS project..."
	@docker compose -f docker-compose.yml down
	@echo "Directus CMS has been stopped."
	@echo "To start it again, run 'make hello-directus-cms-compose-up'"

hello-directus-cms-compose-down-clean:
	@echo "Stopping and removing all containers, networks, and volumes..."
	@docker compose -f docker-compose.yml down --volumes --remove-orphans
	@echo "All resources have been cleaned up."
	@echo "To start the project again, run 'make hello-directus-cms-compose-up'"
	@echo "Note: This will remove all data stored in volumes. Use with caution."