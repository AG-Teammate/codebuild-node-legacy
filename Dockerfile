FROM ubuntu:14.04

USER root

RUN apt-get update && \
    apt-get -y install \
    ca-certificates \
    build-essential \
    libssl-dev \
    libkrb5-dev \
    gcc \
    make \
    ruby-full \
    rubygems-integration \
    python \
    apt-transport-https \
    curl && \
    apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
    
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update -y && apt install yarn -y \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
    
RUN curl -SLO https://nodejs.org/download/release/v6.6.0/node-v6.6.0-linux-x64.tar.gz \
  	&& tar -xzf "node-v6.6.0-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  	&& rm "node-v6.6.0-linux-x64.tar.gz" \
    && npm install -g npm@3.10.8
    
RUN npm install --unsafe-perm -g gulp@3.9.1 bower@1.7.9 grunt-cli@1.2.0
