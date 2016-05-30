#!/bin/bash

ARTIFACTS_FOLDER=artifacts
JIVE_HOME=/usr/local/jive

sudo su - jive -c "jive stop"
sudo su - jive -c "rm -rf ~/applications/sbs/home/plugins/*"

sudo cp $ARTIFACTS_FOLDER/*.* $JIVE_HOME/applications/sbs/home/plugins/
sudo chown jive:jive $JIVE_HOME/applications/sbs/home/plugins/*.*

sudo su - postgres -c "psql -d jive -c 'delete from jiveplugin'"
sudo su - jive -c "jive start"

