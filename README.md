Introduction
===

This repository allows you to use OpenShift's [souce-to-image](https://github.com/openshift/source-to-image) capability to build a [mlflow](https://www.mlflow.org/) server.

Instructions
===

Because I'm not running Docker but podman/buildah, I will first generate the Dockerfile. 

```bash
# s2i build 1.8.0 registry.access.redhat.com/ubi8/python-38 registry.lab.ltsai.com/mlflow:1.8.0 --as-dockerfile /tmp/mlflow/Dockerfile
```

And run `buildah build-using-dockerfile` command.
```bash
# buildah bud -t registry.lab.ltsai.com/mlflow:1.8.0 /tmp/mlflow
```

Finally, push to my registry
```bash
# podman push registry.lab.ltsai.com/mlflow:1.8.0
```

Examples
===
There are sample deployment code in the `/examples` directory for OpenShift. 

Notes
===
If you are using Nexus (I am on OSS 3.23.0-03), it is [not OCI compliant](https://issues.sonatype.org/browse/NEXUS-16947). When OpensShift pulls the image, it will error out with `unsupported docker v2s2 media type`.

You will have to create the image with docker spec using `buildah bud --format=docker`.

