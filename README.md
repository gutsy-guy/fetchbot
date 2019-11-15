# Fetchbot - Human Aware Environment
##### Built for the MiR 100
The Human Aware Environment (HAE) project aims to enable human awareness in a MiR100 robot, to allow interaction directly between an operator and machine. The HAE is a combination of different sensors and coding implementations to enable the MiR100 to interact with and be aware of humans within a set environment.

A demonstration can be viewed here: https://www.youtube.com/watch?v=2XB5GXtKr6w&feature=youtu.be

### Requirements
- 30 GB free space on host machine
- Ubuntu 16.04
- Nvidia graphics card (CUDA)
- Kinect Camera

### Dependencies
- Python
- Node JS
- Docker
- Nvidia-384
- Nvidia-Docker 2

## Docker Setup
1. Clone the repo and start up a docker container (will use the public docker image https://cloud.docker.com/repository/registry-1.docker.io/poppipi/fetchbot_human_aware_environment)
`chmod +x start_human_aware_environment `
`./start_human_aware_environment`

## Manual Docker Build (Optional)
1. Navigate to the docker/ directory and run `sudo docker build -t fetchbot_human_aware_environment .`
2. Edit line 9 in the human aware environment/start_human_aware_environment script, to be `image_name=fetchbot_human_aware_environment`

## Development Environment Setup
1. use the run_single_camera script

## Summoning the MiR
1. Start the docker container using the provided script `chmod +x start_human_aware_environment\n./start_human_aware_environment`

2. Within the docker container terminal, execute the start script `./HAE/docker/start.sh` 

3. Raise your right arm to summon the MiR100 to the GovLab. Left arm pointing will send the MiR100 to the charger.

#### Notes
- you can remove existing human_aware_environment containers using `./start_human_aware_environment -r`
