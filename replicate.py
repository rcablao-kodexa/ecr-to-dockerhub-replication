import yaml
import subprocess
import sys
import os

# Helper Function
def run_command(command, env):
    print(command)
    result = subprocess.Popen(
        command,
        env=env,
        shell=True)
    text = result.communicate()[0]
    if text is not None:
        print(text)
    if result.returncode != 0:
        exit(1)

# Setup variables
dockerhub_user = str(sys.argv[1])
dockerhub_token = str(sys.argv[2])
dockerhub_image_prefix = str(sys.argv[3])
aws_container_registry = str(sys.argv[4])
container_image_name = str(sys.argv[5])
container_image_version = str(sys.argv[6])
aws_access_key = str(sys.argv[7])
aws_secret_access_key = str(sys.argv[8])
aws_region = str(sys.argv[9])

# Read configuration
with open(f"/github/workspace/releases.yml", 'r') as stream:
    config_file = yaml.load(stream, Loader=yaml.FullLoader)

# # Login
# run_command(f"./scripts/login.sh {dockerhub_user} {dockerhub_token} {aws_container_registry} {aws_access_key} {aws_secret_access_key} {aws_region}", os.environ)

# Process
for version in config_file["extensionPacks"]:
  print(f"Processing {version['version']} {version['url']}...")
  run_command(f"./scripts/replicate.sh {dockerhub_user} {dockerhub_token} {dockerhub_image_prefix} {aws_container_registry} {container_image_name} {version['version']}", os.environ)