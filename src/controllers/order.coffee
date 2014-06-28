app = require process.cwd() + '/app'
db  = app.get 'models'

# Order model's CRUD controller.
module.exports =

  # Lists all orders
  index: (req, res) ->
    db.Order.findAll()
      .success (result) ->
        res.format
          json: -> res.json result
          html: -> res.render 'orders', orders: result

  # Creates new order with data from `req.body`
  create: (req, res) ->
    db.Order.create req.body
      .success (result) ->
        if result.ask is 0 then result.ask
        else delete result.bid
        res.statusCode = 201
        res.send result
      .error (err) ->
        res.statusCode = 501
        res.send err

  # Gets order by id
  get: (req, res) ->
    db.Order.find req.params.id
      .success (result) ->
        if not result?
          res.statusCode = 404
          res.render '404', 404
        else
          res.send result
      .error (err) ->
        res.statusCode = 500
        res.send err

  # Updates order with data from `req.body`
  update: (req, res) ->
    db.Order.update req.body,
        id: req.params.id
      .complete (err, result) ->
        if not err?
          res.statusCode = 204
          res.end()
        else
          res.statusCode = 500
          res.send err

  # Deletes order by id
  delete: (req, res) ->
    db.Order.find
        where:
          id: req.params.id
      .success (result) ->
        if not result?
          res.statusCode = 404
          res.render '404', 404
        else
          result.destroy().success ->
            res.statusCode = 204
            res.end()
      .error (err) ->
        res.statusCode = 500
        res.send err
