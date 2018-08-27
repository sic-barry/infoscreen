#!/bin/bash

for pid in `ps -ef | grep chromium-browser | grep -v 'grep' | awk '{print $2}'`; do
  echo "Killing Chromium: $pid"
  kill $pid
done

