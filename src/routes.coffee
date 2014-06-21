#### Routes

module.exports = (app) ->
  
  # simple session authorization
  checkAuth = (req, res, next) ->
    unless req.session.authorized
      res.statusCode = 401
      res.render '401', 401
    else
      next()

  app.get '/private', checkAuth, (req, res, next) ->
    routeMVC('private', 'index', req, res, next)
  
  # Front page
  app.get '/', (req, res, next) ->
    routeMVC('index', 'index', req, res, next)

  # Get resource items list
  app.get '/:controller', (req, res, next) ->
    routeMVC(req.params.controller, 'index', req, res, next)

  # Create new resource item
  app.post '/:controller', (req, res, next) ->
    routeMVC(req.params.controller, 'create', req, res, next)

  # Get resource item by id
  app.get '/:controller/:id', (req, res, next) ->
    routeMVC(req.params.controller, 'get', req, res, next)

  # Update item data
  app.put '/:controller/:id', (req, res, next) ->
    routeMVC(req.params.controller, 'update', req, res, next)

  # Remove resource instance
  app.delete '/:controller/:id', (req, res, next) ->
    routeMVC(req.params.controller, 'delete', req, res, next)

  # Search method in controller with id
  app.all '/:controller/:method/:id', (req, res, next) ->
    routeMVC(req.params.controller, req.params.method, req, res, next)

  # If all else failed, show 404 page
  app.all '/*', (req, res) ->
#    console.warn "error 404: ", req.url
    res.statusCode = 404
    res.render '404', 404

# Render the page based on controller name, method and id
routeMVC = (controllerName, methodName, req, res, next) ->
  controllerName = 'index' if not controllerName?
  controller = null
  try
    controller = require './controllers/' + controllerName
  catch e
#    console.warn "controller not found: " + controllerName, e
    next()
    return
  data = null
  if typeof controller[methodName] is 'function'
    actionMethod = controller[methodName].bind controller
    actionMethod req, res, next
  else
#    console.warn 'method not found: ' + methodName
    next()
