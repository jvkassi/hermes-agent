# Look here for latest version alpine/openclaw - Docker Image
FROM nousresearch/hermes-agent

# Switch to root , to install packages
USER root

RUN apt update -q
RUN apt install chromium iproute2 sudo tmux screen  unzip -y
RUN apt install vim inetutils-ping netcat-traditional jq -y

# Fix node permission
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL ' >> /etc/sudoers
