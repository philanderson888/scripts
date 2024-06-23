const http = require('node:http');
const hostname = '127.0.0.1';
const port = 51279;
const server = http.createServer((req, res) => {
  console.log('request recieved on node server port ' + port)
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  output = `response from node js web server ... running at `
  output += `http://${hostname}:${port}/\n`
  res.end(output);
});
server.listen(port, hostname, () => {
  console.log(`node js web server at http://${hostname}:${port}/`);
});
