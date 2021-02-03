FROM ubuntu:latest
COPY . /workspace
VOLUME ./:/workspace
RUN chmod +xwr workspace/
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils build-essential sudo git nano curl zip locate
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker
WORKDIR /workspace