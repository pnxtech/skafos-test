const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const jsonParser = bodyParser.json();
const axios = require('axios');

const port = 16000;
const serverVersion = require('./package.json').version;
const aiServerAPIHost = 'http://0.0.0.0:15000';

let stringHistory = [];

app.use(express.static('public'));

app.get('/v1/server/version', (_req, res) => res.json({
  "version": serverVersion
}));

app.post('/v1/string/reverse', jsonParser, async (req, res) => {
  let sendInvalidRequest = (res) => {
    res.status(400).json({
      error: 'invalid request'
    });
  }

  if (!req.body) {
    sendInvalidRequest(res);
    return;
  }
  try {
    let json = req.body;
    let response = await axios.post(`${aiServerAPIHost}/v1/string/reverse`, json);
    if (response.status == 200) {
      let string = response.data.string;
      stringHistory.push({
        original: json.string,
        processed: string
      });
      response.data['length'] = string.length;
      return res.json(response.data);
    }
    res.status(response.status).json({
      error: 'service error'
    });
  } catch (e) {
    if (e.errno == 'ECONNREFUSED') {
      res.status(503).json({
        error: 'AI Service is unavailable'
      });
      return;
    }
    sendInvalidRequest(res);
  }
});

app.get('/v1/string/history', (req, res) => {
  res.json({
    history: stringHistory
  });
});

app.listen(port, () => console.log(`Server listening at http://localhost:${port}`));
