#!/bin/bash

VERSION=v1.15.0
IMAGE_NAME=certbot-dns-route53-with-awscli
REPOSITORY_IMAGE_NAME=public.ecr.aws/stonedot/certbot-dns-route53-with-awscli

action="$1"

function usage() {
  program_name=$(basename "$0")
  cat <<EOS
usage: $program_name <action>

<action>
  build    build the docker image
  push     push the docker image to ECR
EOS
}

function build() {
  docker build --force-rm \
    --build-arg BASE_VERSION=${VERSION} \
    -t ${IMAGE_NAME}:${VERSION} \
    ./build

  echo "Created image ${IMAGE_NAME}:${VERSION}"
}

function push() {
  source_image="${IMAGE_NAME}:${VERSION}"
  repo_image="${REPOSITORY_IMAGE_NAME}:${VERSION}"
  docker tag "${source_image}" "${repo_image}"
  aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/stonedot
  docker push "${repo_image}"
}

if [[ $# -ne 1 ]]; then
  usage
  exit
fi

case ${action} in
  build ) build ;;
  push ) push ;;
  * ) usage ;;
esac