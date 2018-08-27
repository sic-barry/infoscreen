#!/bin/bash

cd /home/pi/infoscreen

echo "Update to latest infoscreen client"

has_updates="false"

git fetch
git status --branch --porcelain -uno | find "[behind" && has_updates="true"

if [[ ${has_updates}=="true" ]]; then
  echo "Updates in git repo, pull changes and restart infoscreen"
  source ./stop-infoscreen.sh
	git pull
  source ./start-infoscreen.sh
else
  echo "No updates in git repo"
fi
