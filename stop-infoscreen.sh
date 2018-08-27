#!/bin/bash

cd /home/pi/infoscreen

for pid in `ps -ef | grep chromium-browser | grep -v 'grep' | awk '{print $2}'`; do
  echo "Killing Chromium: $pid"
  kill $pid
done

for pid in `jps -l | grep sic-info-screen-2.0-client | grep -v 'grep' | awk '{print $1}'`; do
  echo "Killing infoscreen client: $pid"
  kill $pid
done
