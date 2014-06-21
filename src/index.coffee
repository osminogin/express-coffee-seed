express = require 'express'
assets = require 'connect-assets'
stylus = require 'stylus'
session = require 'express-session'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
db = require './models'

#### Basic application initialization
# Create app instance
app = express()

# Define port to listen
app.port = process.env.PORT or process.env.VMC_APP_PORT or 3000

#### Database connection
db.sequelize
  .sync force: no
  .complete (err) ->
    throw err if err?

# Store database connection in shared variable
app.set 'models', db

#### View initialization
# Add Connect Assets.
#app.use assets(paths: ["assets/js"
#                       "assets/css"
#                       "public/vendor/bootstrap-stylus/stylus"
#                       "public/vendor"])

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
app.use bodyParser.json()


#### Finalization
# Initialize routes
routes = require './routes'
routes app

# Export application object
module.exports = app
