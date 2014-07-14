express = require 'express'
assets = require 'connect-assets'
passport = require 'passport'
session = require 'express-session'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'

#### Basic application initialization
# Create app instance
app = express()

# Define port to listen
app.port = process.env.PORT or process.env.VMC_APP_PORT or 3000

#### Establishing database connection
db = require './models'

# Print error message if connection fails
db.sequelize
  .sync force: no
  .complete (err) -> throw err[0] if err?

# Store database connection in shared variable
app.set 'models', db

#### View initialization
# Add Connect Assets.
app.use assets(paths: ['assets/js'])

# Set the public folder as static assets.
app.use express.static(process.cwd() + '/public')

# Express Session
console.log "setting session/cookie"
app.use cookieParser()
app.use session(
  secret: "^^CHANGE^^ME^^"
  resave: true
  saveUninitialized: true
)

# Authentication
app.use passport.initialize()
app.use passport.session()

# Set View Engine.
app.set 'view engine', 'jade'

# Parses JSON or XML bodies into `req.body` object
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: no

#### Finalization
# Setup authentication
auth = require './config/passport'
auth app, passport

# Initialize routes
routes = require './routes'
routes app, passport


# Export application object
module.exports = app
