'use strict';
const models = require('../../models/index');

const Iva = models.iva;


exports.get_iva = function(req, res){
	Iva.findOne({
		where: {
			activo_iva: true
		}
	}).then(iva => {
		if (iva !== null){
			res.status(200).json(iva);
		}
		else{
			res.status(404).json({msg: 'Registro de IVA no encontrado'});
		}
	}).catch(err => {
		console.log('Error buscando el IVA ', err);
		res.status(500).json({msg: 'Error buscando el IVA'});
	});
}