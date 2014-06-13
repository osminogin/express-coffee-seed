should = require('chai').should()

app = require process.cwd() + '/app'
db = app.get 'db'


describe 'Database', ->
  it 'should establish a connection', (done) ->
    db.connected.should.be.true
    done()

  it 'should be available databases', (done) ->
    count = 0
    db.query 'SHOW DATABASES'
    .on 'result', (res) ->
      res.on 'row', (row) ->
        count += 1
      .on 'error', (err) ->
        done(err)
    .on 'end', ->
      count.should.be.greaterThan 1
      done()
