# Look here for latest version alpine/openclaw - Docker Image
FROM nousresearch/hermes-agent:v2026.4.23

# Switch to root , to install packages
USER root

RUN apt update -q
RUN apt install chromium iproute2 sudo tmux screen unzip -y
RUN apt install vim inetutils-ping netcat-traditional jq python3-pip  -y

# Fix node permission
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL ' >> /etc/sudoers
RUN usermod -aG sudo hermes
RUN usermod -aG polkitd hermes
