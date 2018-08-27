#!/bin/bash

cd /home/pi/infoscreen

echo "Update to latest infoscreen client"

git fetch
git status --branch --porcelain -uno | grep -q "\[behind"
if [[ $? == 0 ]]; then
  echo "Updates in git repo, pull changes and restart infoscreen"
  source ./stop-infoscreen.sh
	git pull
  source ./start-infoscreen.sh
else
  echo "No updates in git repo"
fi