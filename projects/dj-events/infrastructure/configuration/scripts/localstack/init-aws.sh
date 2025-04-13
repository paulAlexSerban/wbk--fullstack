#!/bin/bash
echo "Initializing some LocalStack resources..."

# Create an S3 bucket for Lambda deployments
awslocal s3 mb s3://assets

awslocal s3api put-bucket-policy --bucket assets --policy '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::assets/*"
    }
  ]
}'
