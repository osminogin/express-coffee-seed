Sequelize = require 'sequelize'
config = require process.cwd() + '/app/config'

# set environment
config.setEnvironment process.env.NODE_ENV or 'development'

# initialize database connection
sequelize = new Sequelize config.DB_NAME, config.DB_USER, config.DB_PASS,
  host: 'localhost'
  port: 3306
  dialect: 'mariadb'
  logging: console.log


# load models
# TODO: Need loads models automaticaly
models = ['User'
          'Order']
models.forEach (model) ->
  module.exports[model] = sequelize.import __dirname + '/' + model.toLowerCase()

# describe relationships
((m) ->
  m.Order.belongsTo m.User
  m.User.hasMany m.Order, as: 'Orders'
  return
) module.exports

# export connection
module.exports.sequelize = sequelize
