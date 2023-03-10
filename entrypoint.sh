#!/bin/sh -l
set -e

dockerhub_user=$1
dockerhub_token=$2
dockerhub_image_prefix=$3
aws_container_registry=$4
container_image_name=$5
container_image_version=$6
aws_access_key=$7
aws_secret_access_key=$8
aws_region=$9

echo "Logging in..."
aws configure set aws_access_key_id $aws_access_key
aws configure set aws_secret_access_key $aws_secret_access_key
aws configure set aws_region $aws_region
aws ecr get-login-password --region $aws_region | crane auth login --username AWS --password-stdin $(echo $aws_container_registry | cut -d "/" -f1)
crane auth login --username $dockerhub_user --password $dockerhub_token registry.hub.docker.com 

echo "Replicating: $aws_container_registry/$container_image_name:$container_image_version"

function docker_image_tag_exists() {
    TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'$dockerhub_user'", "password": "'$dockerhub_token'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)
    curl -s -f -H "Authorization: JWT $TOKEN"  https://hub.docker.com/v2/namespaces/$dockerhub_image_prefix/repositories/$container_image_name/tags/$container_image_version > /dev/null
}

if docker_image_tag_exists; then
    echo "$dockerhub_image_prefix/$container_image_name:$container_image_version exists - skipping replication..."
else
    echo "$dockerhub_image_prefix/$container_image_name:$container_image_version does not exist - starting replication..."
    SOURCE="$aws_container_registry/$container_image_name:$container_image_version"
    DESTINATION="$dockerhub_image_prefix/$container_image_name:$container_image_version"
    # crane copy $SOURCE $DESTINATION
    crane pull $SOURCE "$container_image_name.tar"
    crane push "$container_image_name.tar" $DESTINATION
fi