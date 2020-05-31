#!/bin/sh

mkdir -p /tmp/mlflow
rm -rf /tmp/mlflow/*
s2i build 1.8.0 registry.access.redhat.com/ubi8/python-38 registry.lab.ltsai.com/mlflow:1.8.0 --as-dockerfile /tmp/mlflow/Dockerfile
buildah bud --format=docker -t registry.lab.ltsai.com/mlflow:1.8.0 /tmp/mlflow
podman push registry.lab.ltsai.com/mlflow:1.8.0 