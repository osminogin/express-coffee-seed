module.exports = (sequelize, DataTypes) ->

  sequelize.define 'User',
    username:
      type: DataTypes.STRING
    password:
      type: DataTypes.STRING
      allowNull: false
    email:
      type: DataTypes.STRING
      validate:
        isEmail: true
    first_name: DataTypes.STRING
    last_name: DataTypes.STRING
