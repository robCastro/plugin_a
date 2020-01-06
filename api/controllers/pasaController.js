'use strict';
const models = require('../../models/index');

const Pasa = models.pasa;
const Iva = models.iva;
const Arancel = models.arancel;
const Aduana = models.aduana;

exports.get_pasa_detalle = function(req, res){
	if(isNaN(parseInt(req.params.id_mercancia))){
		res.status(400).json({ msg: 'Utilizar parametros numericos'});
		return;
	}
	Iva.hasMany(Pasa, {foreignKey: 'id_iva'});
	Pasa.belongsTo(Iva, {foreignKey: 'id_iva'});
	Arancel.hasMany(Pasa, {foreignKey: 'id_arancel'})
	Pasa.belongsTo(Arancel, {foreignKey: 'id_arancel'});
	Aduana.hasMany(Pasa, {foreignKey: 'id_aduana'})
	Pasa.belongsTo(Aduana, {foreignKey: 'id_aduana'});
	Pasa.findAll({
			include:[
				{model: Iva},
				{model: Arancel},
				{model: Aduana}
			],
			where: {
				id_mercancia: parseInt(req.params.id_mercancia)
			}
		}).then(pasan => {
			if(pasan.length === 0){
				res.sendStatus(404);
				return;
			}
			let i = 0;
			let detalles = []
			for (i = 0; i<pasan.length; i++){
				let detalle = new Object();
				detalle.nombre_aduana = pasan[i].aduana.nombre_aduana;
				detalle.fecha_registro = pasan[i].fecha_pasa;
				detalle.tasa_entrada = pasan[i].arancel.tasa_entrada_arancel;
				detalle.tasa_paso = pasan[i].arancel.tasa_paso_arancel;
				detalle.otras_tasas = pasan[i].iva.tasa_iva;
				detalle.total_recargos = pasan[i].multa_pasa;
				detalle.estado = pasan[i].retenida_pasa ? "Retenida" : "Liberada";
				detalle.descripcion_estado = pasan[i].retenida_pasa ? "La mercancia se encuentra retenida en la Aduana" : "La mercancia ha cumplido los requisitos y ha pasado";
				detalle.info_extra = 'Tasa de IVA: iva%\nMultas: $mul\n';
				detalle.info_extra = detalle.info_extra.replace('iva', pasan[i].iva.tasa_iva * 100);
				detalle.info_extra = detalle.info_extra.replace('mul', pasan[i].multa_pasa);
				detalles.push(detalle);
			}
			res.status(200).json(detalles);

		}).catch(err => {
			console.log(err);
		});
}


exports.post_pasa = function(req, res) {
	let {id_transporte, id_mercancia, iva, arancel, aduana, retenida_pasa, multa_pasa} = req.body;
	//console.log(id_transporte, id_mercancia, iva, arancel, aduana, retenida_pasa, multa_pasa);
	let errores = [];
	if(isNaN(parseInt(id_transporte))){
		errores.push('Especificar transporte');
	}
	if(isNaN(parseInt(id_mercancia))){
		errores.push('Especificar mercancia');
	}
	if(iva === null || typeof iva === 'undefined' || isNaN(parseInt(iva.id_iva))){
		errores.push('Especificar Iva');
	}
	if(arancel === null || typeof arancel === 'undefined' || isNaN(parseInt(arancel.id_arancel))){
		errores.push('Especificar arancel');
	}
	if(aduana === null || typeof aduana === 'undefined' || isNaN(parseInt(aduana.id_aduana))){
		errores.push('Especificar aduana');
	}
	if(typeof retenida_pasa === 'undefined' || retenida_pasa === null){
		errores.push('Especificar si se retuvo la mercancia');
	}
	if(typeof multa_pasa === 'undefined' || multa_pasa === null){
		errores.push('Especificar multa, si no se multó poner 0');
	}
	else if(multa_pasa < 0){
		errores.push('No se permiten numeros negativos para la multa');
	}
	console.log(errores);
	if(errores.length > 0){
		let msg = "";
		errores.forEach(error => {
			msg = msg + "<ul>" + error + "</ul>";
		});
		res.status(400).json({msg: msg});
		return;
	}
	Pasa.create({
		id_iva: iva.id_iva,
		id_aduana: aduana.id_aduana,
		id_arancel: arancel.id_arancel,
		fecha_pasa: new Date(),
		retenida_pasa: retenida_pasa,
		multa_pasa: multa_pasa,
		id_transporte: id_transporte,
		id_mercancia: id_mercancia,
	}).then(pasa => {
		res.status(200).json(pasa);
	}).catch(err => {
		console.log(err);
		res.status(500).json({msg: 'Error guardando el paso'});
	});
}