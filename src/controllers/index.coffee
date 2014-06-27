# Just renders index.jade

exports.index = (req, res) ->
  res.render 'index', user: req.user
