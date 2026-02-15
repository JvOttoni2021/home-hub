FROM node:20-alpine

WORKDIR /app

# Install git (needed by generators)
RUN apk add --no-cache git

# Copy all project files
COPY package.json package-lock.json* ./
COPY root/ ./root/
COPY react-navbar/ ./react-navbar/

# Install dependencies for root and the react-navbar microfrontend.
# Use --legacy-peer-deps for react-navbar to avoid ERESOLVE during install
# (this mirrors common dev setups; remove if you prefer strict resolution).
# HUSKY=0 skips husky install (no .git in the image).
ENV HUSKY=0
RUN npm ci --prefix root \
	&& npm ci --prefix react-navbar --legacy-peer-deps

# Expose root dev server (9000) and microfrontend dev servers (8500 for react-navbar)
EXPOSE 9000 8500

# Start root dev server in background and run the react-navbar dev server
# in the foreground so the container stays alive. Both servers are bound
# to 0.0.0.0 by passing --host when starting the react-navbar server.
CMD ["sh", "-c", "cd /app/root && npm start & cd /app/react-navbar && npm start -- --port 8500 --host 0.0.0.0"]
