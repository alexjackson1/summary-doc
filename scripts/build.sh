#!/bin/sh
set -eux
DOCUMENT_NAME=summary
IMAGE_NAME=summary
IMAGE_VERSION=latest
IMAGE=${IMAGE_NAME}:${IMAGE_VERSION}
CONTEX_VARIANT=latest
# Build latest document from source
docker build --tag ${IMAGE_NAME} . --build-arg VARIANT=${CONTEX_VARIANT} --build-arg DOCUMENT_NAME=${DOCUMENT_NAME}
# Create container and store id
CID=$(docker create ${IMAGE_NAME})
# Copy build artefact from container
docker cp ${CID}:/${DOCUMENT_NAME}.pdf ./${DOCUMENT_NAME}.pdf
# Destroy container
docker rm ${CID}
exit 0