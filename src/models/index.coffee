fs = require 'fs'
path = require 'path'
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

# load models automatically from dir
fs.readdirSync(__dirname)
  .filter (file) ->
    if file.search(/\.map$/) is -1 and file isnt 'index.js'
      file
  .forEach (file) ->
    model = file.replace /^./, (match) -> match.toUpperCase()
    model = model.replace /\.\w+$/, '' # trim file suffix
    module.exports[model] = sequelize.import path.join __dirname, file

# describe relationships
((m) ->
  m.Order.belongsTo m.User
  m.User.hasMany m.Order, as: 'Orders'
  return
) module.exports

# export connection
module.exports.sequelize = sequelize
