#!/bin/bash

cd /home/pi/infoscreen

# stop infoscreen and chromium if still running
source ./stop-infoscreen.sh

echo "Starting Chromium"
/usr/bin/chromium-browser --allow-file-access-from-files --start-fullscreen /home/pi/infoscreen/info-screen-2.html &

echo "Staring infoscreen client: $client_jar"
source ./settings.env
java -Dclient.mail.server=${SERVER} -Dsic.client.mail.user=${USER} -Dsic.client.mail.password=${PW} -Dsic.client.mail.content.passphrase=${PASSPHRASE} -jar sic-info-screen-2.0-client.jar \
> info-screen-2.0-client.log 2>&1 &
