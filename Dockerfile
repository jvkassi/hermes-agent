# Look here for latest version alpine/openclaw - Docker Image
FROM nousresearch/hermes-agent:v2026.7.1

# Switch to root , to install packages
USER root

RUN apt update -q
RUN apt install chromium iproute2 sudo tmux screen unzip \
    vim inetutils-ping netcat-traditional jq python3-pip  strace python3-pip unzip  git curl  -y
RUN curl -sSL https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
RUN chmod 777 /tmp/get-pip.py

# Fix node permission
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL ' >> /etc/sudoers
RUN usermod -aG sudo hermes
RUN usermod -aG polkitd hermes
RUN usermod -s /bin/bash hermes
RUN echo "alias hermes='/opt/hermes/.venv/bin/hermes'" | tee -a .bashrc

RUN /opt/hermes/.venv/bin/python /tmp/get-pip.py
RUN /opt/hermes/.venv/bin/python -m pip install playwright

USER hermes

RUN hermes plugins enable google_meet

USER root

ENV PATH="$PATH:/command"
