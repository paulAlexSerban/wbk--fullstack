# How to: Add new basic lambda

> Note: use `./backend/functions/hello-lambda` as an example

1. `./backend/functions` - add new lambda function

   - Pattern: `./backend/functions/<lambda-name>`
   - Eg. `./backend/functions/hello-lambda`

2. `./Makefile` - register new command to be used initializing the LocalStack environment

   - Pattern: `$(eval $(call lambda-localstack-compose_template,<lambda-name>))`
   - Eg. `$(eval $(call lambda-localstack-compose_template,hello-lambda))`

3. `./Makefile` - register new command to build an deploy the lambda

   - Pattern: `$(eval $(call lambda-template,<lambda-name>))`
   - Eg. `$(eval $(call localstack-lambda-template,hello-lambda))`

4. `./infrastructure/configuration/env` - add new environment variables file for docker-compose

   - Pattern: `./infrastructure/configuration/env/<lambda-name>.env`
   - Eg: `.hello-lambda.compose.env` && `.hello-lambda.compose.env.example` (for Git tracking - keep sensitive data out of .example file)

5. `./infrastructure/provisioning/scripts` - add new script to deploy the lambda

   - Pattern: `./infrastructure/provisioning/scripts/<lambda-name>.localstack.bash`
   - Eg: `./infrastructure/provisioning/scripts/hello-lambda.localstack.bash`
