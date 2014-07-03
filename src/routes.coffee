#### Routes

module.exports = (app, passport) ->

  # Check valid user
  isValidUser = passport.authenticate 'local', {
    successRedirect: '/'
    failureRedirect: '/user/login'
  }

  # Main application page
  app.get '/', (req, res, next) ->
    routeMVC('home', null, req, res, next)

  # Site partials
  app.get '/partials/:filename', (req, res, next) ->
    fileName = req.params.filename
    viewName = if fileName.match /\.html$/ then fileName.replace /\.html$/, ''
    try
      res.render "partials/#{viewName}"
      return
    catch e
      console.warn "partials not found: " + viewName, e
      next()

  # Authentication
  app.post '/user/login', isValidUser

  app.get '/private', isLoggedIn, (req, res, next) ->
    routeMVC('private', null, req, res, next)

  ## REST API interface
  # Get resource items list
  app.get '/a/:controller', (req, res, next) ->
    routeMVC(req.params.controller, 'index', req, res, next)

  # Create new resource item
  app.post '/a/:controller', (req, res, next) ->
    routeMVC(req.params.controller, 'create', req, res, next)

  # Get resource item by id
  app.get '/a/:controller/:id', (req, res, next) ->
    routeMVC(req.params.controller, 'get', req, res, next)

  # Update item data
  app.put '/a/:controller/:id', (req, res, next) ->
    routeMVC(req.params.controller, 'update', req, res, next)

  # Remove resource instance
  app.delete '/a/:controller/:id', (req, res, next) ->
    routeMVC(req.params.controller, 'delete', req, res, next)


  # Search controller and method with id if present
  app.all '/:controller/:method?/:id?', (req, res, next) ->
    routeMVC(req.params.controller, req.params.method, req, res, next)

  # If all else failed, show 404 page
  app.all '/*', (req, res) ->
    console.warn "error 404: ", req.url
    res.statusCode = 404
    res.render '404', 404

#### Helper functions

# Check user is logged in
isLoggedIn = (req, res, next) ->
  if req.user? then  next()
  else res.redirect '/user/login'

# Render the page based on controller name, method and id
routeMVC = (controllerName = 'index', methodName = 'index', req, res, next) ->
  controller = null
  try
    controller = require './controllers/' + controllerName
  catch e
    console.warn "controller not found: " + controllerName, e
    next()

  if typeof controller[methodName] is 'function'
    actionMethod = controller[methodName].bind controller
    actionMethod req, res, next
  else
    console.warn 'method not found: ' + methodName
    next()

