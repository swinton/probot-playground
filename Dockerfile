FROM node:12-stretch-slim

WORKDIR /build

RUN npm install --global @zeit/ncc@0.20.5

ENTRYPOINT ["/bin/sh"]
