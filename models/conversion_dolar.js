/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('conversion_dolar', {
		id_conversion_dolar: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		valor_conversion_dolar: {
			type: DataTypes.DOUBLE,
			allowNull: false
		},
		fecha_conversion_dolar: {
			type: DataTypes.DATEONLY,
			allowNull: false
		},
		activo_conversion_dolar: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		tableName: 'conversion_dolar',
		timestamps: false
	});
};
