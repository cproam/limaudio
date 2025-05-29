FROM node:22-alpine AS base

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /usr/src/app
COPY limaudio-api/package.json limaudio-api/pnpm-lock.yaml /usr/src/app/
RUN pnpm install
ENV PATH=/usr/src/app/node_modules/.bin:$PATH
COPY limaudio-api/. /usr/src/app/.
RUN chown -R node:node /usr/src/app/
USER node
RUN pnpm run build
EXPOSE 1337
CMD ["pnpm", "run", "develop"]