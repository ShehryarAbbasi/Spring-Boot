#!/bin/bash
echo 'after install script'
sudo yum -y update && sudo yum -y install jq ruby wget java-1.8.0-openjdk && \
sudo alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
java -version > /tmp/afterinstall.log
exit 0