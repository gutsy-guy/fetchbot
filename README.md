# Fetchbot - Human Aware Environment
##### Built for the MiR 100
The Human Aware Environment (HAE) project aims to enable human awareness in a MiR100 robot, to allow interaction directly between an operator and machine. The HAE is a combination of different sensors and coding implementations to enable the MiR100 to interact with and be aware of humans within a set environment.

A demonstration can be viewed here: https://www.youtube.com/watch?v=2XB5GXtKr6w&feature=youtu.be

This repository contains three seperate approaches:
- OpenPTrack with Kinect and MiR100 REST API (Main Implementation)
- OpenPose ROS wrapper with onboard MiR100 sensors (Incomplete Implementation - located within the openpose_ros/ directory)
- Human Aware Environment front end web interface (Proof of concept - located within the haed/ directory)

## OpenPTrack with Kinect and MiR100 REST API
The purpose of the human observation environment is to monitor in real time locations and poses of each individual person in the local environment and subsequently summon and dismiss ‘Blue’, the MiR 100 bot, to and from an individual’s location when the ‘command pose’ is recognised.

OpenPTrack is an open source library for, amongst other things, person tracking and pose annotation in real time via an RGD-D camera. A python interface is used to take interpreted pose annotations and issue specific commands via the MiR100 REST API to summon and dismiss the robot.

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
- Nvidia-Docker 2

### Host Setup
- Ensure the dependencies listed above are installed
- As per OpenPTrack installation, if Nvidia-Docker 1 is installed this must be removed  
`sudo docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f`  
`sudo apt-get purge -y nvidia-docker`
- Note that Nvidia-384 and Nvidia-Docker 2 are required for OpenPTrack and can be installed using the setup_host script provied by OpenPTrack   
`cd human\ aware\ environment/open_ptrack_config/`    
`chmod +x setup_host`   
`./setup_host` 

### User Guide - Starting HAE and summoning the MiR
1. Start our docker container using the provided script (will use our public docker image https://cloud.docker.com/repository/registry-1.docker.io/poppipi/fetchbot_human_aware_environment)  
`chmod +x start_human_aware_environment`  
`./start_human_aware_environment`
2. Ensure the space directly infront of the KinectV2 camera is clear of obstacles and people (About 1-2 meters). Within the docker container terminal, execute the start script  
`./HAE/docker/start.sh`
3. If the OpenPTrack service has successfully started you should see output similar to below:   
![Terminal Output OpenPTrack](/images/openptrack_start_success.png)
4. RViz well then launch shortly after, at which point you may step infront of the camera to ensure skeleton detection is functioning:  
![RViz screenshot](/images/openptrack_rviz.png)
5. Facing the KinectV2 camera, raise your right arm to summon the MiR100 to the GovLab. Left arm pointing will send the MiR100 to the charger.

### Development Environment Setup
1. Use the provided run_single_camera script to run OpenPTrack seperate to interface and controller scripts    
`cd human\ aware\ environment/open_ptrack_config/`  
`chmod +x run_single_camera`  
`./run_single_camera`
2. (Recommended) Within the container terminal, edit the host IP endpoint to the loopback address   
`sed -i '4s/.*/ hostip: "127.0.0.1"/' /root/open_ptrack/opt_utils/conf/json_udp.yaml`
3. Begin OpenPTrack with person tracking and pose annotation  
`roslaunch tracking single_camera_tracking_node.launch enable_pose:=true enable_people_tracking:=true enable_object:=false`  
4. Outside of the container, navigate to the project root directory and launch the OpenPTrack python interface  
`python openptrack_impl.py` 
5. (Optional) You may also provide commands directly to the MiR, calling the mir_controller.js script directly: 
- `node mir_controller.js –i summon`
- `node mir_controller.js –i charger`

#### Manual Docker Build (Optional)
1. Navigate to the docker/ directory and run  
`sudo docker build -t fetchbot_human_aware_environment .`
2. Edit line 9 in the human aware environment/start_human_aware_environment script to use the image you built,  `image_name=fetchbot_human_aware_environment`
3. You may follow the user setup instruction to launch your own docker container

### Notes for Users and Developers
- you can remove existing human_aware_environment containers using `./start_human_aware_environment -r`
- you will need to modify the mir_controller script to ensure the correct endpoint for your MiR100 is being used

#### Citations
[OpenPTrack v1] M. Munaro, A. Horn, R. Illum, J. Burke and R. B. Rusu. OpenPTrack: People Tracking for Heterogeneous Networks of Color-Depth Cameras. In IAS-13 Workshop Proceedings: 1st Intl. Workshop on 3D Robot Perception with Point Cloud Library, pp. 235-247, Padova, Italy, 2014.

M. Munaro and E. Menegatti. Fast RGB-D people tracking for service robots. Journal on Autonomous Robots, vol. 37(3), pp. 227-242, Springer, 2014.

[PoseEstimation and PoseRecognition] M. Carraro, M. Munaro, J. Burke and E. Menegatti. Real-time marker-less multi-person 3D pose estimation in RGB-Depth camera networks. arXiv preprint arXiv:1710.06235, 2017.

Z. Cao, T. Simon, S. E. Wei, and Y. Sheikh, 2016. Realtime multi-person 2d pose estimation using part affinity fields. arXiv preprint arXiv:1611.08050.

T. Simon, H. Joo, I. A. Matthews, and Y. Sheikh, 2017, July. Hand Keypoint Detection in Single Images Using Multiview Bootstrapping. In CVPR (Vol. 1, p. 2).

[ObjectTracking] Y. Zhao, M. Carraro, M. Munaro and E. Menegatti, Fast Multiple Object Tracking in RGB-D Camera Networks, in Intelligent Robots and Systems (IROS), 2017 IEEE/RSJ International Conference on, IEEE, 2017.

## OpenPose ROS wrapper with onboard MiR100 sensors
The main function of this feature is to enable the MiR100 to detect and interact with humans directly, i.e. using the on board sensors available.

[OpenPose ROS wrapper](https://github.com/stevenjj/openpose_ros) for [OpenPose](https://github.com/CMU-Perceptual- Computing-Lab/openpose) combines Robot Operating System (ROS) with OpenPose nodes. OpenPose is used to get real-time multi-person 2D pose data from a RGB camera. 3D pose estimation is then achieved with 3D extractor node implemented in the OpenPose ROS package - through the projection of OpenPose’s 2D pose data onto the point-cloud of the depth image.

Please note, this implementation has not been completed and is currently a work in progress due to issues with the openpose_ros wrapper in its current form. The directory has been left as a reference for future developers, along with notes that we found useful during compiling and attempting to run OpenPose using the MiR100's RGB-D camera node output.

#### Dependencies
- OpenPose ([openpose @ a1e0a5f](https://github.com/CMU-Perceptual-Computing-Lab/openpose/tree/a1e0a5f4136e702b5731a268c2993fb75ca4753c))
- PointCloud - PCL ([installation](http://pointclouds.org/documentation/tutorials/compili ng_pcl_posix.php))
- OpenCV 3
- ROS (Instructions below assume that ROS Lunar has been installed prior, you are not restricted to this release)

### Setup
- Clone the [OpenPose ROS wrapper](https://github.com/stevenjj/openpose_ros) and attempt to follow the installation process, refer to the notes section for help in various circumstances
- Inside openpose_ros_node_firephix.cpp, replace the default “camera topic” with the ROS topic that’s publishing RGB data.
  - To find out the topics and data that topic is publishing, run `rostopic list` and `rostopic echo <name of the ROS topic>`.
  - In the case of MiR’s robot, `/camera_floor_left/driver/color/image_raw` or `/camera_floor_right/driver/color/image_raw`
- Initialize a service node which will act as the listener to the rostopic  
`rosrun openpose_ros_pkg openpose_ros_node`
If the initialization was successful, when “rostopic echo <name of the ROS topic>” command is run, it should show the “openpose_ros” node is subscribed to the topic.
  
#### Notes
- Regading Caffe: If encountered any error for Caffe (e.g. missing, can’t create), run the following command to initialise all submodules:
`git submodule update --init --recursive --remote`
- Regarding PCL: If the installed package contains contain lots of missing libraries, instead of installing each missing one, install the stable version. For this project, pcl-1.7.2 was used.
- Regarding ROS if error message received when attempting to build the workspace: If there’s an error message complaining that ROS is not running/ installed, source setup file by running `source /opt/ros/lunar/setup.bash`
- Regarding OpenPose if an error message is received when attempting to compile: if an error for OpenPose received (OpenPose not found/ OpenPose can’t be started or not compatible), perform the following:
  - Rollback to OpenPose folder from specific git commit (a1e0a5f413) 
  - Uninstall OPCV2 and replace with OPENCV3
- Regarding CMakeList linking errors: If there’s linking error in CMakeList in openpose_ros_pkg and can’t find the packages, add OpenCV to find_package and target_link_libraries as mentioned in https://github.com/stevenjj/openpose_ros/issues/12 (see makino-ryota comment from 22 Jan)

## Human Aware Environment front end web interface
A Django web interface has been provided as a proof of concept to demonstrate how one may go about integrating the existing OpenPTrack implementation with a web based application. Django provides local web server functionality, which this user guide will run to display a static web-page mock up of the proposed functionality. Refer to the notes section for possible future implentations.

#### Dependencies
- Django
- Python 3
- (Recommended) Virtual env

### Host Setup
1. (Recommended) Start a virtual environment with python 3 within the haed/ directed and install the dependencies listed above  
`virtualenv -p python3 venv`  
`source venv/bin/activate`  
`pip install Django`
2. Run the local development server (still within the haed/ directory)   
`python manage.py runserver`
3. If successful, navigate to 127.0.0.1:8000 to view the static page

### Notes for Developers
- You can now edit the views.py script, within hard/dashboard/, to call or run the openptrack_impl.py implementation directly. 
- A wireframe pdf has been included within the haed/ directory, as a visualization of what a complete implementation may look like.
