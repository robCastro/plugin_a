'use strict';
const models = require('../../models/index');

const Arancel = models.arancel;

exports.get_arancel = function(req, res){

	if(isNaN(parseInt(req.params.id_tipo_mercancia))){
		res.status(400).json({ msg: 'Utilizar parametros numericos'});
		return;
	}
	Arancel.findOne({
		where:{
			id_tipo_mercancia: parseInt(req.params.id_tipo_mercancia),
			activo_arancel: true
		}
	}).then(arancel => {
		if (arancel !== null){
			res.status(200).json(arancel);
		}
		else{
			res.status(404).json({msg: 'Arancel no encontrada'});
		}
	}).catch(err => {
		console.log('Error buscando el arancel ', err);
		res.status(500).json({msg: 'Error buscando el arancel'});
	})
}