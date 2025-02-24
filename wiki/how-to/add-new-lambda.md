# How to: Add new basic lambda

> Note: use `./<PROJECT_DIR>/backend/functions/hello-lambda` as an example

1. `./<PROJECT_DIR>/backend/functions` - add new lambda function

   - Pattern: `./<PROJECT_DIR>/backend/functions/<lambda-name>`
   - Eg. `./<PROJECT_DIR>/backend/functions/hello-lambda`

2. `./<PROJECT_DIR>/Makefile` - register new command to be used initializing the LocalStack environment

   - Pattern: `$(eval $(call lambda-localstack-compose_template,<lambda-name>))`
   - Eg. `$(eval $(call lambda-localstack-compose_template,hello-lambda))`

3. `./<PROJECT_DIR>/Makefile` - register new command to build an deploy the lambda

   - Pattern: `$(eval $(call lambda-template,<lambda-name>))`
   - Eg. `$(eval $(call localstack-lambda-template,hello-lambda))`

4. `./<PROJECT_DIR>/infrastructure/configuration/env` - add new environment variables file for docker-compose

   - Pattern: `./<PROJECT_DIR>/infrastructure/configuration/env/<lambda-name>.env`
   - Eg: `.hello-lambda.compose.env` && `.hello-lambda.compose.env.example` (for Git tracking - keep sensitive data out of .example file)
