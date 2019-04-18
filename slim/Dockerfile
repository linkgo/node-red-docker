ARG NODE_VERSION=8
FROM node:${NODE_VERSION}-alpine

# sshd
RUN apk add openssh --update-cache --repository "http://mirrors.ustc.edu.cn/alpine/v3.4/main"
RUN ssh-keygen -A
COPY script/* /sbin/

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
RUN mkdir /data

WORKDIR /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN adduser -u 2001 -h /usr/src/node-red -D node-red \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /usr/src/node-red

USER node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm config set registry "https://registry.npm.taobao.org"
RUN npm config set disturl "https://npm.taobao.org/dist"
RUN npm install --production

# User configuration directory volume
EXPOSE 1880
EXPOSE 22

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["npm", "start", "--", "--userDir", "/data"]
