#!/bin/bash

GAZEBO_IP=172.19.0.4
GENTLE_IP=172.19.0.5

export ROS_IP=$GENTLE_IP
export ROS_MASTER_URI=http://$GAZEBO_IP:11311

COMMANDS="source /eloquent_moveit_ws/install/setup.bash; export ROS_IP="$GENTLE_IP"; export ROS_MASTER_URI=http://"$GAZEBO_IP":11311; ros2 launch ros1_bridge dedicated_bridges_launch.py"

screen -S bridges_screen -dm bash -c "$COMMANDS"


sleep 3
source /home/developer/robocup_melodic_ws/devel/setup.bash
export ROS_IP=$GENTLE_IP
export ROS_MASTER_URI=http://$GAZEBO_IP:11311
roslaunch gb_tiago_manipulation_demo clean_up_demo.launch
