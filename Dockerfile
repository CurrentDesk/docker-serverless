FROM node:8-alpine
RUN apk update
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk add --force apk-tools@edge

# install AWS CLI
RUN apk add alpine-sdk
RUN apk add python3
RUN apk add py-pip
RUN pip install --no-cache-dir awscli
RUN apk add postgresql-client
RUN apk add postgresql-dev
RUN apk add libpq
RUN apk add curl
RUN curl -L https://github.com/hasura/graphql-engine/raw/master/cli/get.sh | ash

ENV SERVERLESS serverless@1.54.0
ENV REPLACE replace@1.1.1
RUN yarn global add $SERVERLESS
RUN yarn global add $REPLACE
WORKDIR /opt/app
