import express from 'express';
import fetch from 'node-fetch';

const app = express();
const PORT = process.env.PORT || 3000;
const OUTPUT_SERVICE_URL = process.env.OUTPUT_SERVICE_URL || 'http://localhost:3001';

app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
      <head>
        <title>Input Service</title>
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
          .test-link {
            display: inline-block;
            background-color: #2563eb;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            text-decoration: none;
            margin-top: 1rem;
            font-weight: 500;
          }
          .test-link:hover {
            background-color: #1d4ed8;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Input Service</h1>
          <p>Send data using a GET request with the <code>data</code> parameter:</p>
          <div class="example">GET /receive?data=hello-world</div>
          <a href="/receive?data=hello-world" class="test-link">Test with "hello-world"</a>
          <p style="margin-top: 1rem;">Then view the result at: <a href="http://localhost:3001" target="_blank">http://localhost:3001</a></p>
        </div>
      </body>
    </html>
  `);
});

app.get('/receive', async (req, res) => {
  const data = req.query.data;
  
  if (data) {
    try {
      // Forward the data to the output service
      const response = await fetch(`${OUTPUT_SERVICE_URL}/update?data=${encodeURIComponent(data)}`);
      
      if (response.ok) {
        res.send(`Data sent to output service: ${data}`);
      } else {
        res.status(500).send('Failed to send data to output service');
      }
    } catch (error) {
      console.error('Error forwarding data:', error);
      res.status(500).send('Error forwarding data to output service');
    }
  } else {
    res.status(400).send('No data parameter provided');
  }
});

app.listen(PORT, () => {
  console.log(`Input service running at http://localhost:${PORT}`);
});