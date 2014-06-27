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
#(function(m) {
#  m.PhoneNumber.belongsTo(m.User);
#  m.Task.belongsTo(m.User);
#  m.User.hasMany(m.Task);
#  m.User.hasMany(m.PhoneNumber);
#})(module.exports);

#Task.belongsTo(User)
#User.hasMany(Task)
#User.hasMany(Tool, { as: 'Instruments' })

# export connection
module.exports.sequelize = sequelize
