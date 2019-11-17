/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('aduana', {
		id_aduana: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		nombre_aduana: {
			type: DataTypes.STRING,
			allowNull: false
		},
		direccion_aduana: {
			type: DataTypes.STRING,
			allowNull: true
		},
		activo_aduana: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		},
		id_pais: {
			type: DataTypes.INTEGER,
			allowNull: false
		}
	}, {
		tableName: 'aduana',
		timestamps: false
	});
};
