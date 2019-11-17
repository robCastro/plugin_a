/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('arancel', {
		id_arancel: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		id_conversion_dolar: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'conversion_dolar',
				key: 'id_conversion_dolar'
			}
		},
		tasa_entrada_arancel: {
			type: DataTypes.DOUBLE,
			allowNull: false
		},
		tasa_paso_arancel: {
			type: DataTypes.DOUBLE,
			allowNull: false
		},
		fecha_arancel: {
			type: DataTypes.DATEONLY,
			allowNull: false
		},
		activo_arancel: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		},
		id_tipo_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		id_pais: {
			type: DataTypes.INTEGER,
			allowNull: false
		}
	}, {
		tableName: 'arancel',
		timestamps: false
	});
};
