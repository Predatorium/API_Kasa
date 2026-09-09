FROM node:22-trixie-slim

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

ENV NODE_ENV=production

CMD ["npm", "start"]