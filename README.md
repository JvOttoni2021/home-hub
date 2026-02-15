
## Development Setup

### Prerequisites
- Docker installed and running

### Running the App with Docker

1. Build the Docker image:
```bash
docker build --no-cache -t home-hub:dev .
```

2. Run the development server:
```bash
docker run -it --rm -p 9000:9000 -p 8500:8500 home-hub:dev
```

The app will be available at `http://localhost:9000/`