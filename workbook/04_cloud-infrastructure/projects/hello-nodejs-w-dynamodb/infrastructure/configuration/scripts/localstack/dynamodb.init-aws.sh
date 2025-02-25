#!/bin/bash
echo "Initializing some LocalStack resources..."

# Create a DynamoDB table
awslocal dynamodb create-table \
    --table-name HelloTableViaInitAWS \
    --attribute-definitions AttributeName=ID,AttributeType=S \
    --key-schema AttributeName=ID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST
