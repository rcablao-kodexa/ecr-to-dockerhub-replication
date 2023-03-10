#!/bin/sh -l
set -e

dockerhub_user=$1
dockerhub_token=$2
container_image_name=$3
container_image_version=$4

echo "Replicating: $container_image_name:$container_image_version"

pwd

ls