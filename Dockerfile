FROM mcr.microsoft.com/devcontainers/base:jammy

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

RUN apt-get update && apt-get install -y \
    openssh-server \
    libtool \
    automake \
    autoconf \
    curl \
    build-essential \
    python2-minimal

USER root
RUN npm install --global klayr-commander

COPY . /workspace

RUN chown -R vscode:vscode /workspace

WORKDIR /workspace

USER vscode