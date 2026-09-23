FROM ubuntu:latest

# Update apt-get and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git \
    python3-yaml

# RUN pip3 install PyYAML     --> which generates the error 1 and fails the build.

# Copy feed.py file to the Docker image
COPY feed.py /usr/bin/feed.py

# Copy entrypoint.sh file to the Docker image
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint for the Docker image
ENTRYPOINT ["/entrypoint.sh"]
