FROM node:20-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --ignore-scripts

COPY . .
RUN npm run prepare && npm prune --omit=dev

ENTRYPOINT ["node", "cli.js"]
CMD ["Hello from Docker!"]
