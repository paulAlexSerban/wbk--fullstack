# ----------------------------------------------
# Build and deploy lambda functions via Bash scripts
# ----------------------------------------------

define localstack-lambda-deploy-via-scripts-template
$(1)_localstack-deploy:
	@bash $(INFRA_SERVER_TEMPLATING_DOCKER_SCRIPTS)/simple-lambda.bash --phase=build --app-name=$(1)
	@bash $(INFRA_PROVISIONING_SCRIPTS)/simple-lambda.localstack.bash --phase=deploy --app-name=$(1)
endef

$(eval $(call localstack-lambda-deploy-via-scripts-template,aws-getting-started-with-lambda))
$(eval $(call localstack-lambda-deploy-via-scripts-template,hello-lambda))

.PHONY: hello-lambda_localstack-deploy aws-getting-started-with-lambda_localstack-deploy \
		hello-lambda-tf_init aws-getting-started-with-lambda-tf_init \
		hello-lambda-tf_apply aws-getting-started-with-lambda-tf_apply \
		hello-lambda-tf_destroy aws-getting-started-with-lambda-tf_destroy

hello-lambda_localstack-deploy:
	@bash $(INFRA_SERVER_TEMPLATING_DOCKER_SCRIPTS)/simple-lambda.bash --phase=build --app-name=hello-lambda
	@bash $(INFRA_PROVISIONING_SCRIPTS)/simple-lambda.localstack.bash --phase=deploy --app-name=hello-lambda

aws-getting-started-with-lambda_localstack-deploy:
	@bash $(INFRA_SERVER_TEMPLATING_DOCKER_SCRIPTS)/simple-lambda.bash --phase=build --app-name=aws-getting-started-with-lambda
	@bash $(INFRA_PROVISIONING_SCRIPTS)/simple-lambda.localstack.bash --phase=build --app-name=aws-getting-started-with-lambda

# ----------------------------------------------
# Build and deploy lambda functions via Terraform
# ----------------------------------------------
define localstack-lambda-deploy-via-terraform-template
$(1)-tf_init:
	@bash $(INFRA_PROVISIONING_TERRAFORM_DIR)/simple-lambda.bash --phase=tf-init --app-name=$(1)

$(1)-tf_apply:
	@bash $(INFRA_SERVER_TEMPLATING_DOCKER_SCRIPTS)/simple-lambda.bash --phase=build --app-name=$(1)
	@bash $(INFRA_PROVISIONING_TERRAFORM_DIR)/simple-lambda.bash --phase=tf-apply --app-name=$(1)

$(1)-tf_destroy:
	@bash $(INFRA_PROVISIONING_TERRAFORM_DIR)/simple-lambda.bash --phase=tf-destroy --app-name=$(1)
endef

$(eval $(call localstack-lambda-deploy-via-terraform-template,hello-lambda))
$(eval $(call localstack-lambda-deploy-via-terraform-template,aws-getting-started-with-lambda))

.PHONY: hello-lambda-tf_init aws-getting-started-with-lambda-tf_init \
		hello-lambda-tf_apply aws-getting-started-with-lambda-tf_apply \
		hello-lambda-tf_destroy aws-getting-started-with-lambda-tf_destroy

hello-lambda-tf_init:
	@bash $(INFRA_PROVISIONING_TERRAFORM_DIR)/simple-lambda.bash --phase=tf-init --app-name=hello-lambda

aws-getting-started-with-lambda-tf_init:
	@bash $(INFRA_PROVISIONING_TERRAFORM_DIR)/simple-lambda.bash --phase=tf-init --app-name=aws-getting-started-with-lambda