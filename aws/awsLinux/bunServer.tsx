const server = Bun.serve({
  port: 3007,
  fetch(request) {
    return new Response("Web server running on bun.sh on Amazon AWS Linux EC2 server");
  },
});
console.log(`Bun web server on Amazon AWS EC2 listening on localhost:${server.port}`);
