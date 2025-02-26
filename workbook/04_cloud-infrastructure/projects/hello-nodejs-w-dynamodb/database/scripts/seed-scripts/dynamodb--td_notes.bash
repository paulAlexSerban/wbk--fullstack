#!/bin/bash
echo "Initializing some LocalStack resources..."

LOREM_STRING="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
TABLE_NAME="td_notes"
REGION="us-east-1" # Change this to your AWS region

generate_string() {
    local COUNT=$1
    echo " [ info ] Generating a random string with $COUNT words..."
    echo $LOREM_STRING | tr ' ' '\n' | shuf | head -n $COUNT | tr '\n' ' '
}

generate_number() {
    local COUNT=$1
    echo "[ info ] Generating a random number between 1 and $1..."
    echo $((RANDOM % $COUNT + 1))
}

generate_status() {
    if [ $((RANDOM % 2)) -eq 0 ]; then
        echo "passed"
    else
        echo "failed"
    fi
}

function create-db() {
    # Create a DynamoDB table
    awslocal dynamodb create-table \
        --table-name $TABLE_NAME \
        --attribute-definitions \
        AttributeName=user_id,AttributeType=S \
        AttributeName=timestamp,AttributeType=N \
        AttributeName=title,AttributeType=S \
        AttributeName=cat,AttributeType=S \
        AttributeName=note_id,AttributeType=S \
        --key-schema \
        AttributeName=user_id,KeyType=HASH \
        AttributeName=timestamp,KeyType=RANGE \
        --local-secondary-indexes \
        "IndexName=user_id-title-index,KeySchema=[{AttributeName=user_id,KeyType=HASH},{AttributeName=title,KeyType=RANGE}],Projection={ProjectionType=ALL}" \
        "IndexName=user_id-cat-index,KeySchema=[{AttributeName=user_id,KeyType=HASH},{AttributeName=cat,KeyType=RANGE}],Projection={ProjectionType=ALL}" \
        --global-secondary-indexes \
        "IndexName=note_id-index,KeySchema=[{AttributeName=note_id,KeyType=HASH}],Projection={ProjectionType=ALL},ProvisionedThroughput={ReadCapacityUnits=1,WriteCapacityUnits=1}" \
        --billing-mode PROVISIONED \
        --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
        --no-cli-pager
}

function add-item() {
    local COUNT=$1
    local USER_ID="user_$(generate_number 10)"
    local TIMESTAMP=$(date +%s) # Current timestamp (seconds)
    local TITLE="title_$(generate_string 5)"
    local CATEGORY="cat_$(generate_number 5)"
    local NOTE_ID="note_$(generate_number 10000)"
    local NOTE_CONTENT="content_$(generate_string 10)"

    echo "Inserting item $COUNT..."

    # Construct the JSON payload using jq
    JSON_PAYLOAD=$(jq -n \
        --arg user_id "$USER_ID" \
        --argjson timestamp "$TIMESTAMP" \
        --arg title "$TITLE" \
        --arg cat "$CATEGORY" \
        --arg note_id "$NOTE_ID" \
        --arg content "$NOTE_CONTENT" \
        '{
        user_id: {S: $user_id},
        timestamp: {N: ($timestamp | tostring)},
        title: {S: $title},
        cat: {S: $cat},
        note_id: {S: $note_id},
        content: {S: $content}
    }')

    # Run the AWS CLI command with the properly formatted JSON
    awslocal dynamodb put-item \
        --table-name "$TABLE_NAME" \
        --region "$REGION" \
        --item "$JSON_PAYLOAD"

    echo "Item $COUNT inserted successfully!"
}

function populate_db() {
    local COUNT=$1
    for INDEX in $(seq 1 $COUNT); do
        add-item $INDEX
    done

    echo "Finished populating $TABLE_NAME with $COUNT random items."
}

# create-db
populate_db 100
