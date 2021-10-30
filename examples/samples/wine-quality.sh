#!/bin/bash

export MLFLOW_S3_ENDPOINT_URL=https://s3-minio.apps.cluster-435b.435b.sandbox766.opentlc.com
export MLFLOW_TRACKING_URI=https://mlflow-mlflow.apps.cluster-435b.435b.sandbox766.opentlc.com

# s3 bucket
export AWS_ACCESS_KEY_ID=mlflow
export AWS_SECRET_ACCESS_KEY=tT8FqTVT3EP8Fmgv

# MLflow basic authentication
export MLFLOW_TRACKING_USERNAME=mlflow
export MLFLOW_TRACKING_PASSWORD=czZ7BmL7eKqsTcCm

./wine-quality.py