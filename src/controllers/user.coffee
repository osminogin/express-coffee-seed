module.exports =

  login: (req, res) ->
    switch req.method
      when 'GET' then  res.render 'user/login'

  logout: (req, res) ->
    req.logout()
    res.redirect '/'

  signup: (req, res) ->
    res.render 'user/signup'

  # TODO: Implement profile page
