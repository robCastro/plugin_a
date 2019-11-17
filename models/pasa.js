/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('pasa', {
		id_pasa: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		id_iva: {
			type: DataTypes.INTEGER,
			allowNull: true,
			references: {
				model: 'iva',
				key: 'id_iva'
			}
		},
		id_aduana: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'aduana',
				key: 'id_aduana'
			}
		},
		id_arancel: {
			type: DataTypes.INTEGER,
			allowNull: true,
			references: {
				model: 'arancel',
				key: 'id_arancel'
			}
		},
		fecha_pasa: {
			type: DataTypes.DATEONLY,
			allowNull: false
		},
		retenida_pasa: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		},
		multa_pasa: {
			type: DataTypes.DOUBLE,
			allowNull: false
		},
		id_transporte: {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		id_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false
		}
	}, {
		tableName: 'pasa',
		timestamps: false
	});
};
