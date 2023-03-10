# ECR to DockerHub Replication

This action replicates container images from ECR repository to Dockerhub

## Inputs

### `dockerhub_user`

**Required** 

### `dockerhub_token`

**Required** 

### `dockerhub_image_prefix`

**Required** 


### `aws_container_registry`

**Required** 

### `container_image_name`

**Required** 

### `container_image_version`

**Required** 


## Example usage

```yaml
    - name: Replicate images
      uses: rcablao-kodexa/ecr-to-dockerhub-replication@main
      with:
        dockerhub_user: ''
        dockerhub_token: ''
        dockerhub_image_prefix: ''
        aws_container_registry: ''
        container_image_name: ''
        container_image_version: ''
        aws_access_key: ''
        aws_secret_access_key: ''
        aws_region: ''
```