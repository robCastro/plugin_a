'use strict';
const models = require('../../models/index');

const Pasa = models.pasa;
const Iva = models.iva;
const Arancel = models.arancel;
const Aduana = models.aduana;

exports.get_pasa_detalle = function(req, res){
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