#!/bin/bash
set -e

dockerhub_user=$1
dockerhub_token=$2
aws_container_registry=$3
aws_access_key=$4
aws_secret_access_key=$5
aws_region=$6

echo "Logging in..."
aws configure set aws_access_key_id $aws_access_key
aws configure set aws_secret_access_key $aws_secret_access_key
aws configure set aws_region $aws_region
aws ecr get-login-password --region $aws_region | docker login --username AWS --password-stdin $(echo $aws_container_registry | cut -d "/" -f1)
docker login --username $dockerhub_user --password $dockerhub_token