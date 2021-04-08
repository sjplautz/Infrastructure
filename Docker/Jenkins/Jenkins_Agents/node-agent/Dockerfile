FROM jenkins/inbound-agent:4.7-1-alpine AS agent

# copy all the binaries from node image to our agent
USER root
COPY --from=node:15.13.0-alpine3.10 /usr/local/bin /usr/local/bin
COPY --from=node:15.13.0-alpine3.10 /opt /opt
COPY --from=node:15.13.0-alpine3.10 /usr/local/lib/node_modules /usr/local/bin/node_modules

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]