#!/bin/bash

####################################################################
# These instruction will tell you how to use this script, you can 
# either set an alias to change the desktop background, add this
# script to cron to change it on a schedule, or both.
####################################################################
# How to Config ####################################################
# 1. Change user to your username
# 2. Change dir to the directory where you have your background 
# images.
####################################################################
# How to get the property below ####################################
# 1. Run this command in terminal: xfconf-query -c xfce4-desktop -m
# 2. Change the background of your desktop.
# 3. After you changed the background copy the output from the
# terminal into the property value below.
####################################################################
# How to change your desktop background daily at 1am with cron #####
# 1. In a terminal run: crontab -e and type in your password
# 2. At the bottom of the page add 
# 0 1 * * * bash /path-to-this-script/xfce_random_wallpaper.sh
####################################################################
# How to create an alias to change the desktop background  #########
# 1. Using your favorite editor open your .bashrc file.
# 2. At the bottom of the page add
# alias wall="bash /path-to-this-script/xfce_random_wallpaper.sh"
# name the alias whatever you want, in this example it is wall.
####################################################################
# Config ###########################################################
# Username #########################################################
user=""
# Random Image Directory ###########################################
dir="/home/$USER/Pictures"
####################################################################
# Property #########################################################
property=""
####################################################################
uid="$(id -u $user)"

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus

rand=$(find $dir -type f -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" | shuf | head -n 1)

xfconf-query -c xfce4-desktop -p $property -s "$rand"
