#!/bin/bash

sudo su - jive -c "jive stop"
sudo su - jive -c "rm -rf ~/applications/sbs/home/plugins/*"

sudo su - postgres -c "psql -d jive -c 'delete from jiveplugin'"
sudo su - jive -c "jive start"

