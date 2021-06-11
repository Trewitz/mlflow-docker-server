# mlflow-docker-server
Docker container for setting up mlflow server in local docker container


```cmd
docker run -it -v <ArtifactStore>:/opt/mlflow/artifactStore -v <DBStore>:/opt/mlflow/db -p 5000:5000 mlflow
```