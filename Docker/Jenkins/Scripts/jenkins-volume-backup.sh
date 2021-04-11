#!/bin/bash

docker run --rm --volumes-from myjenkins -v /home/stephen/Backups:/backup busybox tar cvf /backup/jenkins-data.tar /var/jenkins_home
cp /home/stephen/Backups/jenkins-data.tar /home/stephen/Onedrive/Backups/Jenkins/Volumes/
