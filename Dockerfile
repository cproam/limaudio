FROM node:22-alpine

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /limaudio-api/
COPY package.json package-lock.json ./
RUN npm install -g node-gyp
RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install
ENV PATH=/limaudio-api/node_modules/.bin:$PATH
COPY . .
RUN chown -R node:node /limaudio-api/
USER node
RUN ["npm", "run", "build"]
EXPOSE 1337
CMD ["npm", "run", "develop"]
