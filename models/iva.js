/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('iva', {
		id_iva: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		tasa_iva: {
			type: DataTypes.DOUBLE,
			allowNull: false
		},
		fecha_iva: {
			type: DataTypes.DATEONLY,
			allowNull: false
		},
		activo_iva: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		tableName: 'iva',
		timestamps: false
	});
};
