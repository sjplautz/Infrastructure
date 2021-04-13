FROM jenkins/inbound-agent:4.7-1-alpine

# Install kubectl from Docker Hub k8s image
USER root
COPY --from=lachlanevenson/k8s-kubectl:latest /usr/local/bin/kubectl /usr/local/bin/kubectl

USER jenkins