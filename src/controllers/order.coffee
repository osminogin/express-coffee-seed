app = require process.cwd() + '/app'
db  = app.get 'models'
utils = require('sequelize').Utils

# Order model's CRUD controller.
module.exports =

  # Lists all orders
  index: (req, res) ->
    db.Order.findAll
        order: ['bid', 'ask']
      .complete (err, result) ->
        res.send err if err?
        output =
          asks: utils._.where result, bid: null
          bids: utils._.where result, ask: null
        res.json output

  # Creates new order with data from `req.body`
  create: (req, res) ->
    db.Order.create req.body
      .success (result) ->
        res.statusCode = 201
        res.send result
      .error (err) ->
        res.statusCode = 501
        res.send err

  # Gets order by id
  get: (req, res) ->
    db.Order.find
        where:
          id: req.params.id
      .complete (err, result) ->
        if not err?
          res.send result
        else
          res.statusCode = 500
          res.send err

  # Updates order with data from `req.body`
  update: (req, res) ->
    db.Order.update req.body,
        id: req.params.id
      .complete (err) ->
        if not err?
          res.send 204 # No content
        else
          res.send 400

  # Deletes order by id
  delete: (req, res) ->
    db.Order.find
        where:
          id: req.params.id
      .complete (err, result) ->
        if not err?
          result.destroy().success ->
            res.send 204
        else
          res.send 400
