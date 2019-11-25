var express = require('express'),
    app = express(),
    port = process.env.PORT || 3001;

app.listen(port);

app.use('/api/plugina', require('./api/routes/routes'));

console.log('RESTful API server started on: ' + port);
