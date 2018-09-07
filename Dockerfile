FROM node:8.10-alpine
RUN apk update
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk add --force apk-tools@edge
# install AWS CLI
RUN apk add aws-cli --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ENV SERVERLESS serverless@1.30.3
RUN yarn global add $SERVERLESS
WORKDIR /opt/app
