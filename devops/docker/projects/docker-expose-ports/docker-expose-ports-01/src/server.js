import express from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

// Store received data
let receivedData = 'No data received yet';

// Serve static files
app.use(express.static('public'));

// Handle GET requests with data parameter
app.get('/receive', (req, res) => {
  const data = req.query.data;
  
  if (data) {
    receivedData = data;
    console.log(`Received data: ${data}`);
    res.send(`Data received: ${data}`);
  } else {
    res.status(400).send('No data parameter provided');
  }
});

// Display the current data
app.get('/display', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
      <head>
        <title>Received Data</title>
        <style>
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            line-height: 1.5;
            color: #333;
          }
          .container {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
          }
          h1 {
            color: #2563eb;
            margin-top: 0;
          }
          .data-display {
            background-color: #f3f4f6;
            padding: 1rem;
            border-radius: 4px;
            font-family: monospace;
            margin-top: 1rem;
            border-left: 4px solid #2563eb;
          }
          .refresh {
            margin-top: 1rem;
            color: #6b7280;
            font-size: 0.875rem;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Docker Port Demo</h1>
          <p>This page displays the most recently received data:</p>
          <div class="data-display">${receivedData}</div>
          <p class="refresh">Refresh this page to see updated data</p>
        </div>
      </body>
    </html>
  `);
});

// Root route to explain how to use the app
app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
      <head>
        <title>Docker Port Demo</title>
        <style>
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            line-height: 1.5;
            color: #333;
          }
          .container {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
          }
          h1 {
            color: #2563eb;
            margin-top: 0;
          }
          h2 {
            color: #4b5563;
            margin-top: 2rem;
          }
          code {
            background-color: #f3f4f6;
            padding: 0.2rem 0.4rem;
            border-radius: 4px;
            font-family: monospace;
          }
          .example {
            background-color: #f3f4f6;
            padding: 1rem;
            border-radius: 4px;
            font-family: monospace;
            margin-top: 0.5rem;
            border-left: 4px solid #2563eb;
          }
          .links {
            margin-top: 2rem;
            display: flex;
            gap: 1rem;
          }
          .links a {
            display: inline-block;
            background-color: #2563eb;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
          }
          .links a:hover {
            background-color: #1d4ed8;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Docker Port Demo</h1>
          <p>This simple server demonstrates how Docker can expose ports for bidirectional communication.</p>
          
          <h2>How to use:</h2>
          <p>1. Send data to the server using a GET request with the <code>data</code> parameter:</p>
          <div class="example">GET /receive?data=hello-world</div>
          
          <p>2. View the received data on the display page:</p>
          <div class="example">GET /display</div>
          
          <div class="links">
            <a href="/display">View Data</a>
          </div>
        </div>
      </body>
    </html>
  `);
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});