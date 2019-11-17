'use strict';
const models = require('../../models/index');
const Aduana = models.aduana;

exports.get_aduanas = function(req, res) {
  Aduana.findAll()
    .then(aduanas => {
	res.status(200).json(aduanas);
    })
    .catch(err => {
	console.log('Error: ' + err);
	res.status(500).json({ msg: "Error al mostrar aduanas" });
    });
};
