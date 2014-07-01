module.exports =

  login: (req, res) ->
    res.render 'user/login'

  logout: (req, res) ->
    req.logout()
    res.redirect '/'

  signup: (req, res) ->
    res.render 'user/signup'

  # TODO: Implement profile page
  profile: (req, res) ->
    res.render 'user/profile'

