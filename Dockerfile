FROM node:20-alpine

WORKDIR /app

# Install git (needed by generators)
RUN apk add --no-cache git

# Copy all project files
COPY package.json package-lock.json* ./
COPY root/ ./root/

# Install dependencies for root project
RUN npm ci --prefix root

EXPOSE 9000

CMD ["npm", "run", "dev"]
