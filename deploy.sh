#!/bin/bash

ARTIFACTS_FOLDER=artifacts
JIVE_HOME=/usr/local/jive
SBS_HOME=$JIVE_HOME/applications/sbs/home

sudo su - jive -c "jive stop"
sudo su - jive -c "rm -rf $SBS_HOME/plugins/*"
sudo su - jive -c "rm -rf $SBS_HOME/themes/*"

sudo cp $ARTIFACTS_FOLDER/*.jar $SBS_HOME/plugins/
sudo unzip $ARTIFACTS_FOLDER/*.zip -d $SBS_HOME/themes/
sudo chown jive:jive $SBS_HOME/plugins/*.*
sudo chown -R jive:jive $SBS_HOME/themes/*

sudo su - postgres -c "psql -d jive -c 'delete from jiveplugin'"
sudo su - jive -c "jive start"

