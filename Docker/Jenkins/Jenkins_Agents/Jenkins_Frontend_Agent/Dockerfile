FROM jenkins/inbound-agent:4.7-1-alpine AS agent

# copy all the binaries from this build container to our agent
USER root
COPY --from=circleci/node:10-stretch-browsers /bin /bin
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]