LocalStrategy = require('passport-local').Strategy

module.exports = (app, passport) ->
  # Get database models
  db = app.get 'models'

  # Serialize and deserialize users out of session
  passport.serializeUser (user, done) ->
    done null, user.id

  passport.deserializeUser (id, done) ->
    db.User.find id
      .complete (err, user) ->
        done err if err?
        done null, user

  # Local signup strategy
  passport.use 'local', new LocalStrategy (username, password, done) ->
    db.User.find
        where:
          username: username
          password: password
          isActive: true
      .complete (err, user) ->
        done err if err?
        done null, user

  return

