module.exports = (sequelize, DataTypes) ->

  sequelize.define 'Order',
    first_name: DataTypes.STRING
    last_name: DataTypes.STRING
    item_title: DataTypes.STRING
    total_price: DataTypes.STRING
