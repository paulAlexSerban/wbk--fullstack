#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

APP_NAME=""
# inspired from maven phases (https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)
PHASE=""

for arg in "$@"; do
    case $arg in
    --app-name=*)
        APP_NAME="${arg#*=}"
        shift
        ;;
    --phase=*)
        PHASE="${arg#*=}"
        shift
        ;;
    esac
done

if [ -z "$APP_NAME" ]; then
    echo "Please provide the app name"
    exit 1
fi

if [ -z "$PHASE" ]; then
    echo "Please provide the phase"
    exit 1
fi

ENV_FILE="../../infrastructure/configuration/env/.${APP_NAME}.compose.env"
source ${ENV_FILE}

SERVER_PUBLIC_UPLOADS_DIR="../..${CMS_PROJECT_PATH}/public/uploads"
CONTENT_DATA_DIR="../data"

SERVER_ASSETS_DIR="${CONTENT_DATA_DIR}/server-assets"
SERVER_ASSETS_DIR_TMP="${SERVER_ASSETS_DIR}/.tmp-data"
SERVER_UPLOADS_ZIP="uploads.zip"
SERVER_UPLOADS_ZIP_PATH_TMP="${SERVER_ASSETS_DIR_TMP}/${SERVER_UPLOADS_ZIP}"
SERVER_UPLOADS_ZIP_PATH="${SERVER_ASSETS_DIR}/${SERVER_UPLOADS_ZIP}"

function backup-server-assets() {
    echo "[ 📦 🐳 --- backup server assets ]"
    BACK_PATH=$(pwd)

    if [ ! -d "${SERVER_PUBLIC_UPLOADS_DIR}" ]; then
        echo "Error: Uploads directory not found at ${SERVER_PUBLIC_UPLOADS_DIR}"
        exit 1
    fi

    if [ ! -d "${SERVER_ASSETS_DIR_TMP}" ]; then
        mkdir -p "${SERVER_ASSETS_DIR_TMP}"
    fi

    # check if SERVER_PUBLIC_UPLOADS_DIR has content
    if [ -z "$(ls -A ${SERVER_PUBLIC_UPLOADS_DIR})" ]; then
        echo "Error: Uploads directory is empty at ${SERVER_PUBLIC_UPLOADS_DIR}"
    else
        cp -rfv ${SERVER_PUBLIC_UPLOADS_DIR}/* ${SERVER_ASSETS_DIR_TMP}
        cd ${SERVER_ASSETS_DIR_TMP}

        zip -r ${SERVER_UPLOADS_ZIP} ./*
        cd $BACK_PATH

        if [ -f "${SERVER_UPLOADS_ZIP_PATH_TMP}" ]; then
            echo "✅ Uploads have been backed up to ${SERVER_UPLOADS_ZIP_PATH_TMP}"
        else
            echo "❌ Failed to create the uploads backup file."
            exit 1
        fi

        mv ${SERVER_UPLOADS_ZIP_PATH_TMP} ${SERVER_ASSETS_DIR}
    fi
}

function restore-server-assets() {
    echo "[ 📦 🐳 --- restore server assets ]"

    if [ ! -f $SERVER_UPLOADS_ZIP_PATH ]; then
        echo "Error: Uploads backup file not found at ${SERVER_UPLOADS_ZIP_PATH}"
        exit 1
    fi

    unzip -o "${SERVER_UPLOADS_ZIP_PATH}" -d "$SERVER_PUBLIC_UPLOADS_DIR" > /dev/null
}

KEYS_DIR="${CONTENT_DATA_DIR}/keys"
KEYS_DIR_TMP="${KEYS_DIR}/.tmp-data"
KEYS_BACKUP_FILE="${KEYS_DIR_TMP}/keys.env"
KEYS_ZIP_FILE="keys.zip"
KEYS_ZIP_FILE_PATH_TMP="${KEYS_DIR_TMP}/${KEYS_ZIP_FILE}"
KEYS_ZIP_FILE_PATH="${KEYS_DIR}/${KEYS_ZIP_FILE}"

function backup-keys() {
    echo "[ 📦 --- Backing up Strapi keys and database credentials ]"

    BACK_PATH=$(pwd)

    if [ ! -f "$ENV_FILE" ]; then
        echo "Error: Environment file not found at $ENV_FILE"
        exit 1
    fi

    if [ ! -d "$CONTENT_DATA_DIR" ]; then
        mkdir -p "$CONTENT_DATA_DIR"
    fi

    if [ ! -d "$KEYS_DIR_TMP" ]; then
        mkdir -p "$KEYS_DIR_TMP"
    fi

    if [ -f "$KEYS_BACKUP_FILE" ]; then
        cp -f "$KEYS_BACKUP_FILE" "${KEYS_BACKUP_FILE}-$(date +%Y%m%d%H%M%S).bak"
        echo "✅ Existing backup file renamed to ${KEYS_BACKUP_FILE}-$(date +%Y%m%d%H%M%S).bak"
    fi

    # Extract the required keys and database credentials
    grep -E "^(APP_KEYS|API_TOKEN_SALT|ADMIN_JWT_SECRET|TRANSFER_TOKEN_SALT|JWT_SECRET|DATABASE_CLIENT|DATABASE_HOST|DATABASE_PORT|DATABASE_NAME|DATABASE_USERNAME|DATABASE_PASSWORD)" "$ENV_FILE" >"${KEYS_BACKUP_FILE}"

    # Verify the backup file was created
    if [ -f "${KEYS_BACKUP_FILE}" ]; then
        echo "✅ Keys and database credentials have been backed up to ${KEYS_BACKUP_FILE}"
    else
        echo "❌ Failed to create the keys backup file."
        exit 1
    fi

    cd ${KEYS_DIR_TMP}

    zip -r ${KEYS_ZIP_FILE} ./*
    cd $BACK_PATH

    if [ -f "${KEYS_ZIP_FILE_PATH}" ]; then
        echo "✅ Uploads have been backed up to ${KEYS_ZIP_FILE_PATH}"
    else
        echo "❌ Failed to create the uploads backup file."
        exit 1
    fi

    mv ${KEYS_ZIP_FILE_PATH_TMP} ${KEYS_DIR}

    # # ask user for a password to encrypt the backup file
    # read -sp "Enter a password to encrypt the backup file: " ZIP_PASSWORD
    # # zip and encrypt the backup file
    # zip -P "${ZIP_PASSWORD}" -j "${KEYS_BACKUP_FILE}.zip" "${KEYS_BACKUP_FILE}"
    # # remove the unencrypted backup file
    # rm "${KEYS_BACKUP_FILE}"
}

function restore-keys() {
    echo "[ 📦 --- Restoring Strapi keys and database credentials ]"

    # # ask user for the password to decrypt the backup file
    # read -sp "Enter the password to decrypt the backup file: " ZIP_PASSWORD
    # # unzip the backup file
    # unzip -P "${ZIP_PASSWORD}" "${KEYS_BACKUP_FILE}.zip" -d "$(dirname "${KEYS_BACKUP_FILE}")"

    if [ ! -f "${KEYS_ZIP_FILE_PATH}" ]; then
        echo "Error: Backup file not found at ${KEYS_ZIP_FILE_PATH}"
        exit 1
    fi

    mkdir -p "${KEYS_DIR_TMP}/unzipped"
    unzip -o "${KEYS_ZIP_FILE_PATH}" -d "${KEYS_DIR_TMP}/unzipped" > /dev/null

    # updated ENV_FILE defined keys with the backup file values
    while IFS= read -r line; do
        key=$(echo "$line" | cut -d'=' -f1)
        value=$(echo "$line" | cut -d'=' -f2-)
        sed -i '' "s|^$key=.*|$key=$value|" "$ENV_FILE"
    done <"${KEYS_DIR_TMP}/unzipped/keys.env"

    # Verify the restoration was successful
    if grep -q "APP_KEYS" "$ENV_FILE"; then
        echo "[ ✅ ] Keys and database credentials have been restored from ${KEYS_BACKUP_FILE}"
    else
        echo "[ ❌ ] Failed to restore the keys."
        exit 1
    fi
}

CLOUD_S3_ASSETS_DIR="${CONTENT_DATA_DIR}/cloud-assets"
CLOUD_S3_ASSETS_DIR_TMP="${CLOUD_S3_ASSETS_DIR}/.tmp-data"
CLOUD_S3_ASSETS_ZIP="cloud-assets.zip"
CLOUD_S3_ASSETS_ZIP_PATH="${CLOUD_S3_ASSETS_DIR}/${CLOUD_S3_ASSETS_ZIP}"
CLOUD_S3_ASSETS_ZIP_PATH_TMP="${CLOUD_S3_ASSETS_DIR_TMP}/${CLOUD_S3_ASSETS_ZIP}"

function backup-cloud-s3-assets() {
    echo "[ 📦 --- Backing up cloud S3 assets ]"

    BACK_PATH=$(pwd)

    if [ ! -d "${CLOUD_S3_ASSETS_DIR_TMP}" ]; then
        mkdir -p "${CLOUD_S3_ASSETS_DIR_TMP}"
    fi

    # Copy the contents of the S3 bucket to the temporary directory
    aws --endpoint-url=http://localhost:4566 s3 cp s3://${AWS_UPLOADS_BUCKET_NAME}/ "${CLOUD_S3_ASSETS_DIR_TMP}" --recursive

    cd ${CLOUD_S3_ASSETS_DIR_TMP}

    zip -r ${CLOUD_S3_ASSETS_ZIP} ./*
    cd $BACK_PATH

    if [ -f "${CLOUD_S3_ASSETS_ZIP_PATH_TMP}" ]; then
        echo "✅ Uploads have been backed up to ${CLOUD_S3_ASSETS_ZIP_PATH_TMP}"
    else
        echo "❌ Failed to create the uploads backup file."
        exit 1
    fi

    mv ${CLOUD_S3_ASSETS_ZIP_PATH_TMP} ${CLOUD_S3_ASSETS_DIR}
}

function restore-cloud-s3-assets() {
    echo "[ 📦 --- Restoring cloud S3 assets ]"

    if [ ! -f "${CLOUD_S3_ASSETS_ZIP_PATH}" ]; then
        echo "Error: Uploads backup file not found at ${CLOUD_S3_ASSETS_ZIP_PATH}"
        exit 1
    fi

    mkdir -p "${CLOUD_S3_ASSETS_DIR_TMP}/unzipped"
    unzip -o "${CLOUD_S3_ASSETS_ZIP_PATH}" -d "${CLOUD_S3_ASSETS_DIR_TMP}/unzipped" > /dev/null

    # Upload the contents of the temporary directory to the S3 bucket
    aws --endpoint-url=http://localhost:4566 s3 cp "${CLOUD_S3_ASSETS_DIR_TMP}/unzipped/" s3://${AWS_UPLOADS_BUCKET_NAME}/ --recursive
}

function clean-tmp-data() {
    echo "[ 🧹 --- Cleaning temporary data ]"

    if [ -d "${SERVER_ASSETS_DIR_TMP}" ]; then
        rm -rf "${SERVER_ASSETS_DIR_TMP}"
    fi

    if [ -d "${KEYS_DIR_TMP}" ]; then
        rm -rf "${KEYS_DIR_TMP}"
    fi

    if [ -d "${CLOUD_S3_ASSETS_DIR_TMP}" ]; then
        rm -rf "${CLOUD_S3_ASSETS_DIR_TMP}"
    fi
}



$PHASE && echo "[ ✅ ] --- done" || echo "[ 🚫 ]Failed"
