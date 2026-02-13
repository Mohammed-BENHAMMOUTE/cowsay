# Use official Node.js LTS Alpine image for small size
FROM node:20-alpine

WORKDIR /app

# Copy package files for dependency install (better layer caching)
COPY package.json package-lock.json* ./

# Install production dependencies only
RUN npm ci --omit=dev 2>/dev/null || npm install --omit=dev

# Copy application source
COPY . .

# Default to cowsay CLI; pass args as the message
ENTRYPOINT ["node", "cli.js"]
CMD ["Moo!"]
