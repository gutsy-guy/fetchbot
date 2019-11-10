# Fetchbot - Human Aware Environment
##### Built for the MiR 100

### Requirements
- Ubuntu 16.04
- Nvidia graphics card (CUDA)
- Kinect Camera
- Running OpenPTrack Docker image (Installation guide - https://github.com/OpenPTrack/open_ptrack_v2/wiki/Docker-Images)

### Dependencies
- Python
- Node JS

## Summoning the MiR
1. Start up the single camera tracking docker image
"./run_single_camera"

2. Within the docker image, begin the human/pose tracking components
"roslaunch tracking single_camera_tracking_node.launch enable_pose:=true enable_people_tracking:=true enable_object:=false"

3. Run the python script listener
"python openptrack_impl.py"

4. Raise your right arm to summon the MiR to the GovLab.
