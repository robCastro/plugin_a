var express = require('express'),
    app = express(),
    port = process.env.PORT || 3001;

const cors = require('cors');
const bodyParser = require('body-parser');

app.use(cors());
app.use(bodyParser.json());


app.use('/api/plugin', require('./api/routes/routes'));


app.listen(port);
console.log('RESTful API server started on: ' + port);
