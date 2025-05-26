# Docker Port Demo

This simple project demonstrates how Docker exposes ports for bidirectional communication in a web application.

## How It Works

1. The application is a simple Express.js web server that:
   - Listens for GET requests with a `data` query parameter
   - Stores the received data
   - Displays the data on a web page

2. Docker exposes port 3000, allowing:
   - Incoming requests to reach the container (input)
   - Outgoing responses to return to the client (output)

## Running Locally

### Without Docker

1. Install dependencies:
   ```
   npm install
   ```

2. Start the server:
   ```
   npm start
   ```

3. Access the application at http://localhost:3000

### With Docker

1. Build and start the container:
   ```
   docker-compose up
   ```

2. Access the application at http://localhost:3000

## Testing the Bidirectional Communication

1. Send data to the server:
   - Visit http://localhost:3000/receive?data=hello-world in your browser
   - Or use curl: `curl "http://localhost:3000/receive?data=hello-world"`

2. View the received data:
   - Visit http://localhost:3000/display in your browser

## Understanding Docker Port Mapping

In the `docker-compose.yml` file, the port mapping `"3000:3000"` works as follows:

- The first number (3000) is the port on your host machine (your Mac)
- The second number (3000) is the port inside the Docker container
- This creates a bidirectional tunnel allowing traffic to flow both ways

This demonstrates that Docker port exposure allows both:
- Input: External requests entering the container
- Output: Container responses going back to the client

## running with raw docker commands instead of docker compose

instead of docker compose which runs

```yaml
version: '3'

services:
  web:
    build: .
    ports:
      # This maps port 3000 from inside the container to port 3000 on your host machine
      # Format: "HOST_PORT:CONTAINER_PORT"
      - "3000:3000"
    environment:
      - PORT=3000
```

we can use bash commands to achieve the same goal

```bash
docker build -t docker-port-demo .
docker run -p 3000:3000 docker-port-demo
```


## view docker output

to view docker output we can run the 

```bash
DOCKER_BUILDKIT=0
```

command before the docker build command, on the same line ie

```BASH
DOCKER_BUILDKIT=0 docker build -t docker-port-demo .
```