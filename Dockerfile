FROM node:lts-bullseye

# Update everything and install needed dependencies
RUN apt-get update && apt-get install -y graphicsmagick tzdata

# # Set a custom user to not have n8n run as root
USER root

# Install n8n and the also temporary all the packages
# it needs to build it correctly.
RUN apt-get update && apt-get install -y python build-essential ca-certificates && \
    npm_config_user=root npm install -g n8n@latest && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data

CMD ["n8n"]
