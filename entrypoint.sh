#!/bin/sh

mlflow server \
    --host $SERVER_HOST \
    --port $SERVER_PORT \
    --backend-store-uri sqlite:///${DB_STORE}/mydb.sqlite \
    --default-artifact-root ${ARTIFACT_STORE}