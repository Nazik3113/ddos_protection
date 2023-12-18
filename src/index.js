const express = require('express');
const path = require('path');

const app = express();

const port = 6969;

app.use(express.json());
app.use(express.static("express"));

app.get('/', (req, res) => {
    res.sendFile(path.join(`${__dirname}/static/index.html`));
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});