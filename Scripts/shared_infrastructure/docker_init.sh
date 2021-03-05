#!/bin/bash
printf "removing old versions of Docker if any.."
apt-get remove docker docker-engine docker.io containerd runc
printf "\n***************done***************\n\n"
printf "updating apt packages"
apt-get update
printf "\n***************done***************\n\n"
printf "installing packages to allow apt to access repos over https.."
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
printf "\n***************done***************\n\n"
printf "adding Docker's GPG key using curl.."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
printf "\n***************done***************\n\n"
printf "printing docker repository fingerprint for authenticity verification: $(apt-key fingerpting 0EBFCD88)"
printf "\n***************done***************\n\n"
printf "adding stable Docker repository.."
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
printf "\n***************done***************\n\n"
printf "installing Docker engine.."
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
printf "\n***************done***************\n\n"
printf "running hello world container to verify process completed successfully.."
docker run hello-world
printf "\n***************done***************\n\n"
printf "installing docker-compose api"
curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
printf "\n***************done***************\n\n"
printf "************process complete************"
