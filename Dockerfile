FROM python:3.7.10

ENV MLFLOW_HOME /opt/mlflow
ENV SERVER_PORT 5000
ENV SERVER_HOST 0.0.0.0
ENV DB_STORE ${MLFLOW_HOME}/db
ENV ARTIFACT_STORE ${MLFLOW_HOME}/artifactStore

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN  mkdir -p ${MLFLOW_HOME} && \
    mkdir -p ${DB_STORE} && \
    mkdir -p ${ARTIFACT_STORE}

COPY entrypoint.sh ${MLFLOW_HOME}/entrypoint.sh

EXPOSE ${SERVER_PORT}/tcp

WORKDIR ${MLFLOW_HOME}

CMD ["sh", "entrypoint.sh"]