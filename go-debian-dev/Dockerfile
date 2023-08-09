# go-debian-dev/Dockerfile
FROM debian-dev AS go-debian-dev

# Install additional dependencies for go-debian-dev
RUN sudo apt-get update && \
    sudo apt-get install -y golang default-jdk javahelper

# Start an interactive shell by default
CMD ["bash"]