app = require process.cwd() + '/app'

port = app.port

app.listen port, ->
  console.log "Listening on " + port + "\nPress CTRL-C to stop server."
