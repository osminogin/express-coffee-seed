# Just renders index.jade

exports.index = (req, res) ->
  db = req.app.get 'models'
  db.Order.findAll()
    .success (result) ->
      res.send result
#    res.render 'index'