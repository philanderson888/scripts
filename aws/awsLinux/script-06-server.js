const http = require('node:http');
const hostname = '127.0.0.1';
const port = 3006;
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  output = `Response from http node server running on AWS EC2 at `
  output += `http://${hostname}:${port}/\n`
  res.end(output);
});
server.listen(port, hostname, () => {
  console.log(`server 06 - nodejs web server running on Amazon EC2 basic server instance at http://${hostname}:${port}/`);
});