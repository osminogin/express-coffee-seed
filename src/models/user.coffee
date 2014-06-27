module.exports = (sequelize, DataTypes) ->

  sequelize.define 'User',
    username:
      type: DataTypes.STRING
      unique: true
      validate:
        isAlphanumeric: true
    password:
      type: DataTypes.STRING(64)
      allowNull: false
    email:
      type: DataTypes.STRING
      unique: true
      validate:
        isEmail: true
    isActive:
      type: DataTypes.BOOLEAN
      allowNull: false
      defaultValue: true
