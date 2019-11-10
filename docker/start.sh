#!/bin/bash

roslaunch tracking single_camera_tracking_node.launch enable_pose:=true enable_people_tracking:=true enable_object:=false
python /HAE/fetchbot/openptrack_impl.py