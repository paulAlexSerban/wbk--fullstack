
IMAGE_NAME="getting-started-with-lambda"

function build() {
    docker build -t $IMAGE_NAME .
}

function run() {
    docker run -p 9000:8080 $IMAGE_NAME
}

function test() {
    curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"payload":"hello world!"}'
}

$1