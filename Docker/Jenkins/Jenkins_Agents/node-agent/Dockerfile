FROM jenkins/inbound-agent 

# copy all the binaries from node image to our agent
USER root
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /opt /opt
COPY --from=node /usr/local/lib/node_modules/npm /usr/local/bin/node_modules/npm

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]