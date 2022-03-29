FROM python:3.6-alpine

LABEL version="1.0.0"

RUN apk add autoconf
RUN apk add --update nodejs npm
RUN apk add --update npm

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    git \
    openssl \
    openssh-client \
    autoconf \
    automake \
    bash \
    g++ \
    libc6-compat \
    libjpeg-turbo-dev \
    libpng-dev \
    make \
    nasm
# We need these deps for git and docusaurus

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]