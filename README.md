# Fetchbot - Human Aware Environment
##### Built for the MiR 100
The Human Aware Environment (HAE) project aims to enable human awareness in a MiR100 robot, to allow interaction directly between an operator and machine. The HAE is a combination of different sensors and coding implementations to enable the MiR100 to interact with and be aware of humans within a set environment.

A demonstration can be viewed here: https://www.youtube.com/watch?v=2XB5GXtKr6w&feature=youtu.be

This repository contains three seperate approaches:
- OpenPTrack with Kinect and MiR100 REST API (Main Implementation)
- OpenPose ROS wrapper with MiR100 robot (Incomplete Implementation)
- Human Aware Environment front end web interface (Proof of concept)

## OpenPTrack with Kinect and MiR100 REST API

### General Setup
#### Requirements
- 30 GB free space on host machine
- Ubuntu 16.04
- Nvidia graphics card (CUDA)
- Kinect Camera

#### Dependencies
- Python
- Node JS
- Docker
- Nvidia-384
- Nvidia-Docker 2 (May be install 

### User Setup (Docker)
- Clone this repo to start up a docker container (will use our public docker image https://cloud.docker.com/repository/registry-1.docker.io/poppipi/fetchbot_human_aware_environment)
`cd human\ aware\ environment/`
`chmod +x start_human_aware_environment `
`./start_human_aware_environment`

### Starting HAE and summoning the MiR
1. Start the docker container using the provided script . 
`chmod +x start_human_aware_environment` . 
`./start_human_aware_environment` . 
2. Within the docker container terminal, execute the start script 
`./HAE/docker/start.sh`
3. Facing the KinectV2 camera, raise your right arm to summon the MiR100 to the GovLab. Left arm pointing will send the MiR100 to the charger.

### Development Environment Setup
1. Use the provided run_single_camera script to run OpenPTrack seperate to interface and controller scripts . 
`cd human\ aware\ environment/open_ptrack_config/` . 
`chmod +x run_single_camera` . 
`./run_single_camera` . 
2. (Recommended) Within the container terminal, edit the host IP endpoint to the loopback address . 
`sed -i '4s/.*/ hostip: "127.0.0.1"/' /root/open_ptrack/opt_utils/conf/json_udp.yaml` . 
3. Begin OpenPTrack with person tracking and pose annotation . 
`roslaunch tracking single_camera_tracking_node.launch enable_pose:=true enable_people_tracking:=true enable_object:=false` . 
4. Outside of the container, navigate to the project root directory and launch the OpenPTrack python interface . 
`python openptrack_impl.py` . 
5. (Optional) You may also provide commands directly to the MiR, calling the mir_controller.js script directly:  
`node mir_controller.js –i summon` . 
`node mir_controller.js –i charger` . 

#### Manual Docker Build (Optional)
1. Navigate to the docker/ directory and run `sudo docker build -t fetchbot_human_aware_environment .`
2. Edit line 9 in the human aware environment/start_human_aware_environment script to use the image you built, `image_name=fetchbot_human_aware_environment`
3. You may follow the user setup instruction to launch your own docker container

#### Citations
[OpenPTrack v1] M. Munaro, A. Horn, R. Illum, J. Burke and R. B. Rusu. OpenPTrack: People Tracking for Heterogeneous Networks of Color-Depth Cameras. In IAS-13 Workshop Proceedings: 1st Intl. Workshop on 3D Robot Perception with Point Cloud Library, pp. 235-247, Padova, Italy, 2014.

M. Munaro and E. Menegatti. Fast RGB-D people tracking for service robots. Journal on Autonomous Robots, vol. 37(3), pp. 227-242, Springer, 2014.

[PoseEstimation and PoseRecognition] M. Carraro, M. Munaro, J. Burke and E. Menegatti. Real-time marker-less multi-person 3D pose estimation in RGB-Depth camera networks. arXiv preprint arXiv:1710.06235, 2017.

Z. Cao, T. Simon, S. E. Wei, and Y. Sheikh, 2016. Realtime multi-person 2d pose estimation using part affinity fields. arXiv preprint arXiv:1611.08050.

T. Simon, H. Joo, I. A. Matthews, and Y. Sheikh, 2017, July. Hand Keypoint Detection in Single Images Using Multiview Bootstrapping. In CVPR (Vol. 1, p. 2).

[ObjectTracking] Y. Zhao, M. Carraro, M. Munaro and E. Menegatti, Fast Multiple Object Tracking in RGB-D Camera Networks, in Intelligent Robots and Systems (IROS), 2017 IEEE/RSJ International Conference on, IEEE, 2017.

#### Notes
- you can remove existing human_aware_environment containers using `./start_human_aware_environment -r`
- you will need to modify the mir_controller script to ensure the correct endpoint for your MiR100 is being used
