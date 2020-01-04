'use strict';
const models = require('../../models/index');

const Aduana = models.aduana;

exports.get_aduana = function(req, res){

	if(isNaN(parseInt(req.params.id_aduana))){
		res.status(400).json({ msg: 'Utilizar parametros numericos'});
		return;
	}
	Aduana.findOne({
		where:{
			id_aduana: parseInt(req.params.id_aduana),
			activo_aduana: true
		}
	}).then(aduana => {
		if (aduana !== null){
			res.status(200).json(aduana);
		}
		else{
			res.status(404).json({msg: 'Aduana no encontrada'});
		}
	}).catch(err => {
		console.log('Error buscando la aduana ', err);
		res.status(500).json({msg: 'Error buscando la aduana'});
	})
}