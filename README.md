
## Development Setup

### Prerequisites
- Docker installed and running

### Running the App with Docker

#### Option 1: Using Dockerfile (Recommended)

1. Build the Docker image:
```bash
docker build -t home-hub:dev .
```

2. Run the development server:
```bash
docker run -it --rm -p 9000:9000 home-hub:dev
```

The app will be available at `http://localhost:9000/`

#### Option 2: Using Docker CLI directly

If you prefer not to create a Dockerfile, you can run:

```bash
docker run -it --rm \
  -v c:\Git\home-hub:/app \
  -p 9000:9000 \
  --entrypoint sh \
  node:20-alpine
```

Then inside the container:
```bash
apk add --no-cache git
cd /app
npm ci --prefix root
npm run dev
```

### Stopping the Development Server

Press `Ctrl+C` in the terminal to stop the server.
