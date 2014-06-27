db = app.get 'models'

describe 'Database', ->
  it 'should flush data and sync to last database scheme', (done) ->
    db.sequelize
      .sync force: true
      .complete (err) ->
        done err if err?
        # check empty data
        db.Order.findAll()
          .complete (err, orders) ->
            done err if err?
            orders.should.have.length 0
            done()

  it 'should create test user', (done) ->
    db.User.create
      username: 'testuser'
      password: 'testpassword'
      email: 'test@example.com'
    .complete (err, user) ->
      done err if err?
      user.should.exist
      user.should.have.property 'username'
      user.should.have.property 'password'
      user.should.have.property 'email'
      user.id.should.equal 1
      done()

  it 'should create new order for user', (done) ->
    db.Order.create
      UserId: 1
      bid: 2.3666
      value: 1
    .complete (err, order) ->
      done err if err?
      order.should.exist
      order.should.have.property 'bid'
      order.should.have.property 'ask'
      order.should.have.property 'value'
      order.should.have.property 'UserId'
      order.id.should.equal 1
      done()

  it 'should get orders related to test user', (done) ->
    db.User.find(1).complete (err, user) ->
      done err if err?
      user.getOrders().complete (err, orders) ->
        done err if err?
        orders.should.have.length 1
        done()

  it 'should be a available databases', (done) ->
    db.sequelize
      .query 'SHOW DATABASES'
      .success (dbs) ->
        dbs.should.have.length.at.least 2
        done()
