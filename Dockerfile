FROM python:3.7.10

ENV MLFLOW_HOME /opt/mlflow
ENV SERVER_PORT 5000
ENV SERVER_HOST 0.0.0.0
ENV DB_STORE ${MLFLOW_HOME}/db
ENV ARTIFACT_STORE gs://tr-artifact-storage

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN  mkdir -p ${MLFLOW_HOME} && \
    mkdir -p ${DB_STORE}

COPY entrypoint.sh ${MLFLOW_HOME}/entrypoint.sh
COPY google-auth/gcloud_auth.json ${MLFLOW_HOME}/gcloud_auth.json

ENV GOOGLE_APPLICATION_CREDENTIALS=${MLFLOW_HOME}/gcloud_auth.json

EXPOSE ${SERVER_PORT}/tcp

WORKDIR ${MLFLOW_HOME}

CMD mlflow server \
    --host $SERVER_HOST \
    --port $SERVER_PORT \
    --backend-store-uri sqlite:///${DB_STORE}/mydb.sqlite \
    --default-artifact-root ${ARTIFACT_STORE} 