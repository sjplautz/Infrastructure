FROM jenkins/inbound-agent:4.7-1-alpine AS agent

# copy all the binaries from this build container to our agent
USER root
COPY --from=circleci/node:10-stretch-browsers /usr/local/bin /usr/local/bin
COPY --from=circleci/node:10-stretch-browsers /opt /opt
COPY --from=circleci/node:10-stretch-browsers /usr/local/lib/node_modules /usr/local/bin/node_modules
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]