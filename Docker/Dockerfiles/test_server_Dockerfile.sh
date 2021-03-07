FROM nginx
# add a directory to the root for app development
RUN mkdir /home/myapp && \
    cd /home/myapp && \  
    touch dummy.txt && \
    echo "hey sexy" > dummy.txt
RUN echo "Hello World... from test server running container"