FROM jenkins/inbound-agent:4.7-1 AS agent

# agent template must bind mount the docker socket
USER root
RUN apt-get -y update 
RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable"
RUN apt-get update && apt-get -y install docker-ce docker-ce-cli
RUN curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)"\
 -o /usr/local/bin/docker-compose && \
 chmod +x /usr/local/bin/docker-compose && \
 ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# must use sudo to access docker daemon as jenkins
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]