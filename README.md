# mlflow-docker-server
Docker container for setting up mlflow server hosted local in a docker container. With Google Cloud Storage (GCS) as artifact storage

## Running the server
Remember to setup the volumes with desired folders where the persistant storage needs to be.

Simple docker run command to setup the server og localhost:5000
```cmd
docker run -it -v <DBStore>:/opt/mlflow/db -p 5000:5000 mlflow
```