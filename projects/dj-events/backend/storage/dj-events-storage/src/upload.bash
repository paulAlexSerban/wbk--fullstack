#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

# get and list all files and folders in /assets dir

ASSETS_DIR_PATH="../assets"
S3_BUCKET="assets"

if [ ! -d "$ASSETS_DIR_PATH" ]; then
    echo "Directory $ASSETS_DIR_PATH does not exist."
    exit 1
fi

function list_files() {
    local DIR="$1"
    local PREFIX="$2"

    for FILE in "$DIR"/*; do
        if [ -d "$FILE" ]; then
            list_files "$FILE" "$PREFIX$(basename "$FILE")/"
        else
            echo "${PREFIX}$(basename "$FILE")"
        fi
    done
}

# Populate FILE_LIST array using a while loop
FILE_LIST=()
while IFS= read -r FILE; do
    FILE_LIST+=("$FILE")
done < <(list_files "$ASSETS_DIR_PATH" "")

function upload_to_s3() {
    local FILE_PATH="$1"
    # trim ../assets/ from the file path
    local FILE_KEY="${FILE_PATH#../assets/}"
    local S3_KEY=$FILE_KEY

    echo "[ 🚀 ] --- Uploading $FILE_PATH to s3://$S3_BUCKET/$S3_KEY"
    awslocal s3 cp "$FILE_PATH" "s3://$S3_BUCKET/$S3_KEY"
}

# Iterate over the array and upload each file
for ITEM in "${FILE_LIST[@]}"; do
    upload_to_s3 "$ASSETS_DIR_PATH/$ITEM"
done

# prin urls to access files
for ITEM in "${FILE_LIST[@]}"; do
    FILE_KEY="${ITEM#../assets/}"
    S3_KEY=$FILE_KEY
    echo "----------------------------------------"
    echo "AWS S3 URN: s3://$S3_BUCKET/$S3_KEY"
    echo "AWS S3 URL: http://localhost:4566/assets/$S3_KEY"
done