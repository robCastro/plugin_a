var express = require('express'),
    app = express(),
    port = process.env.PORT || 3001;

const cors = require('cors');
const bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(cors());

let url = 'http://localhost:3000';
const env = process.env.NODE_ENV || 'development';
if (env === 'production'){
	url = 'https://igfcore.herokuapp.com';
}
const clienteSocket = require('socket.io-client')(url);

clienteSocket.on('connection', function(){
	console.log('Conectado a socket.io en: ' + url);
});

//Guardando cliente socket dentro de app para ser llamado desde ./routes/api/controllers/pasaController.js
app.set('clienteSocket', clienteSocket);

app.use('/api/plugin', require('./api/routes/routes'));





app.listen(port);
console.log('RESTful API server started on: ' + port);
