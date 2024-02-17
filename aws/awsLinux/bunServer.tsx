const server = Bun.serve({
  port: 3007,
  fetch(request) {
    console.log('request received on port ' + server.port)
    return new Response("Web server running on bun.sh on Amazon AWS Linux EC2 server port " + server.port);
  },
});
console.log(`Bun web server on Amazon AWS EC2 listening on localhost:${server.port}`);
