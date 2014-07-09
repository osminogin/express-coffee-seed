module.exports =

  logout: (req, res) ->
    req.logout()
    res.redirect '/'
