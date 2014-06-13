util = require 'util'
inspect = util.inspect

chai = require 'chai'
chai.should()

app = require process.cwd() + '/app'
db = app.get 'db'


describe 'Database Server', ->
  it 'should establish a connection', (done) ->
    db.connected.should.be.true
    done()

  it 'should be available databases', (done) ->
#    db.query 'SHOW DATABASES'
#    .on 'result', (res) ->
#      console.log inspect res.count()
#      res.on 'row', (row) ->
#        console.log 'Result row: ' + row
#      .on 'error', (err) ->
#        console.log 'Result error: ' + err
#        done(err)
