ARG VARIANT="latest"
FROM mcr.microsoft.com/azure-cli

RUN apk add --update nodejs npm
RUN apk add --update npm

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]