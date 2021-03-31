FROM jenkins/inbound-agent
USER root

# Install kubectl from Docker Hub.
COPY --from=lachlanevenson/k8s-kubectl:latest /usr/local/bin/kubectl /usr/local/bin/kubectl