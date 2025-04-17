#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

ASSETS_DIR_PATH="../assets"
S3_BUCKET="assets"

if [ ! -d "$ASSETS_DIR_PATH" ]; then
    echo "Directory $ASSETS_DIR_PATH does not exist."
    exit 1
fi

function upload_to_s3() {
    aws --endpoint-url=http://localhost:4566 s3 cp "$ASSETS_DIR_PATH" "s3://$S3_BUCKET/" --recursive
}

upload_to_s3
