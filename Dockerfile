FROM node:lts-trixie-slim

RUN apt-get update && apt-get install -y \
  python3 \
  python3-venv \
  python3-pip \
  python3-setuptools \
  build-essential python3-dev \
  rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /usr/src/electron-release-server

# Install app dependencies
COPY package.json .bowerrc bower.json /usr/src/electron-release-server/
RUN npm install \
  && ./node_modules/.bin/bower install --allow-root \
  && npm cache clean --force \
  && npm prune --production

# Bundle app source
COPY . /usr/src/electron-release-server

COPY config/docker.js config/local.js

EXPOSE 80

CMD [ "npm", "start" ]
