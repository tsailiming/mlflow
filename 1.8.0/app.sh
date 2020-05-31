#!/bin/bash

# Cater for Openshift Container Storage 4 OBC/OB config map variables
if [ -z "$DEFAULT_ARTIFACT_ROOT" ]
then
  DEFAULT_ARTIFACT_ROOT="s3://$BUCKET_NAME"
  # Can't ignore self signed cert unless we use external route
  # https://github.com/mlflow/mlflow/blob/master/mlflow/store/artifact/s3_artifact_repo.py#L42
  export MLFLOW_S3_ENDPOINT_URL=http://$BUCKET_HOST
fi

if [ -z "$BACKEND_STORE_URI" ]
then
  # 4 slash for absolute path
  BACKEND_STORE_URI="sqlite:////tmp/mlflow.db"
fi


BACKEND_STORE_PATH=`python -c "import os; import urllib; from urllib.parse import urlsplit; print(os.path.dirname(urlsplit('$BACKEND_STORE_URI').path[1:]))"`

echo "BACKEND_STORE_URI=$BACKEND_STORE_URI"
echo "DEFAULT_ARTIFACT_ROOT=$DEFAULT_ARTIFACT_ROOT"
echo "MLFLOW_S3_ENDPOINT_URL=$MLFLOW_S3_ENDPOINT_URL"

/bin/mkdir -p $BACKEND_STORE_PATH
mlflow server --host=0.0.0.0 -p 8080 --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $DEFAULT_ARTIFACT_ROOT