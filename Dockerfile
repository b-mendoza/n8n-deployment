FROM node:12.13.0-alpine

# Update everything and install needed dependencies
RUN apk add --update graphicsmagick tzdata

# # Set a custom user to not have n8n run as root
USER root

# Install n8n and the also temporary all the packages
# it needs to build it correctly.
RUN apk --update add --virtual build-dependencies python build-base ca-certificates && \
    npm_config_user=root npm install -g n8n@1.112.6 && \
    apk del build-dependencies

WORKDIR /data

CMD ["n8n"]
