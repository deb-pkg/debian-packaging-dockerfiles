# go-debian-dev/Dockerfile
FROM debian-dev AS java-debian-dev

# Install additional dependencies for go-debian-dev
RUN sudo apt-get update && \
    sudo apt-get install -y default-jdk javahelper

# Add environment variables to the user's shell profile
ENV DEBEMAIL=$EMAIL DEBFULLNAME=$FULLNAME
RUN git config --global user.name "$EMAIL" && \
    git config --global user.email "$FULLNAME"

# Start an interactive shell by default
CMD ["bash"]