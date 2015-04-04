FROM gliderlabs/alpine:3.1
RUN mkdir -p /app &&\
    chown daemon:daemon /app &&\
    sed -i.bak -e 's+daemon:x:2:2:daemon:+daemon:x:2:2:daemon:/app:/bin/bash+' /etc/passwd
WORKDIR /app
ENV HOME /app
RUN apk-install nodejs git python make gcc g++ openssl-dev
USER daemon
RUN git clone https://github.com/bitpay/bitcore-node.git /app
RUN npm install
