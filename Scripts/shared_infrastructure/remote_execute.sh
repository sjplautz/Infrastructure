#!/bin/bash

# echo "script to execute?"
# read SCRIPTNAME

echo "<user>@<hostname> to execute script on?"
read HOST

ssh $HOST ./home/stephen/Software/Scripts/shared_infrastructure/containerd.sh

echo "done"