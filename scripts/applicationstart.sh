#!/bin/bash
echo 'app start script' > /tmp/appstart.log
cd /tmp
sudo ln -s /tmp/gs-spring-boot-0.1.0.jar /etc/init.d/rest-app
sudo service rest-app start
exit 0
