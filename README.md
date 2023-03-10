# ECR to DockerHub Replication

This action replicates container images from ECR repository to Dockerhub

## Inputs

### `dockerhub_user`

**Required** 

### `dockerhub_token`

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
        container_image_name: ''
        container_image_version: ''
```