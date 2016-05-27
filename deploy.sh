#!/bin/bash

sudo su -c "jive stop" -s /bin/sh jive
sudo su -c "rm -rf ~/applications/sbs/home/plugins/*" -s /bin/sh jive

sudo su -c "psql -d jive -c 'delete from jiveplugin'" -s /bin/sh postgres
sudo su -"jive start" -s /bin/sh jive

