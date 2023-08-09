# Use a base image, for example, the official Debian image
FROM debian:bookworm

# Set a label for the image
LABEL maintainer="your-email@example.com"

# Run bash when the container starts
CMD ["bash"]
