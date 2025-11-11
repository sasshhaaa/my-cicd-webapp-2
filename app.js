const express = require('express');
const app = express();
const port = process.env.PORT || 8080; // Azure App Service sets PORT automatically

app.get('/', (req, res) => {
  res.send('Hello from CI/CD on Azure!');
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});