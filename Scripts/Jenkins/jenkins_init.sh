#!/bin/bash

DOCKER_COMPOSE_FILE_PATH=$1
USER=$2
FS_PATH=/home/$USER

echo "downloading jenkins image"
docker pull jenkins/jenkins
echo "\n************done************\n\n"
echo "making jenkins directories"
mkdir -p $FS_PATH/jenkins/jenkins-data $FS_PATH/jenkins/jenkins-data/jenkins-volume
cd $FS_PATH/jenkins/jenkins-data
chown $USER:$USER jenkins-volume -R
echo "\n************done************\n\n"
echo "placing docker-compose file into jenkins-data"
cp $DOCKER_COMPOSE_FILE_PATH .
echo "\n************done************\n\n"
echo "bringing up jenkins service"
docker-compose up -d
echo "\n************done************\n\n"
echo "adding jenkins build server to hosts as: jenkins-build.local"
echo "192.168.0.187 jenkins-build.local" >> /etc/hosts
echo "\n************done************\n\n"
echo "retrieving initial jenkins admin password"
echo "password is: $(cat /var/jenkins_home/secrets/initialAdminPassword)"
echo "\n************done************\n\n"
