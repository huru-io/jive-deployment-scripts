#!/bin/bash

sudo su - jive
jive stop
rm -rf applications/sbs/home/plugins/*
exit
sudo su - postgres
psql -d jive -c "delete from jiveplugin"
exit
sudo su - jive
jive start

