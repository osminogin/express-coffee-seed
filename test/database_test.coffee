should = require('chai').should()

app = require process.cwd() + '/app'
db = app.get 'models'


describe 'Database', ->
  it 'should sync with last database schema', (done) ->
    # flush data (carefully on test db only)
    db.sequelize
      .sync force: true
      .complete (err) ->
        done err if err?
        # check empty data
        db.Order.findAll()
          .success (orders) ->
            orders.should.have.length 0
            done()

  it 'should be able add a new row in the table', (done) ->
    db.Order.create first_name: "John", last_name: "Doe"
      .success (order) ->
        order.should.exist
        order.should.have.property 'id'
        done()

  it 'should be available databases', (done) ->
    db.sequelize
      .query 'SHOW DATABASES'
      .success (dbs) ->
        dbs.should.have.length.at.least 1
        done()
