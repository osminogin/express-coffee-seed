express = require 'express'
assets = require 'connect-assets'
stylus = require 'stylus'
mongoose = require 'mongoose'
session = require 'express-session'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'

#### Basic application initialization
# Create app instance.
app = express()

# Define Port & Environment
app.port = process.env.PORT or process.env.VMC_APP_PORT or 3000
env = process.env.NODE_ENV or "development"

# Config module exports has `setEnvironment` function that sets app settings depending on environment.
config = require "./config"
config.setEnvironment env

#### Database connection
# Load MariaDB connector
Client = require 'mariasql'
db = new Client()
db.connect
  host: config.DB_HOST,
  user: config.DB_USER,
  password: config.DB_PASS,
  db: config.DB_NAME

#db.on 'connect', ->
#  console.log 'Database connected'

# Exit without database connection
db.on 'error', (err) ->
  console.log 'Database ' + err
  process.exit()

#app.set 'models', require './models'
app.set 'db', db

#### View initialization
# Add Connect Assets.
app.use assets(paths: ["assets/js", "assets/css",
                       "public/vendor/bootstrap-stylus/stylus",
                       "public/vendor"])

# Set the public folder as static assets.
app.use express.static(process.cwd() + '/public')

# Express Session
console.log "setting session/cookie"
app.use cookieParser()
app.use session(
  secret: "** CHANGE ** ME **"
  key: "sid"
  cookie:
    secure: true
)


# Set View Engine.
app.set 'view engine', 'jade'

# Parses JSON or XML bodies into `req.body` object
app.use bodyParser()


#### Finalization
# Initialize routes
routes = require './routes'
routes(app)


# Export application object
module.exports = app

