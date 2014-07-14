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

  it 'should be a available databases', (done) ->
    db.sequelize
      .query 'SHOW DATABASES'
      .success (dbs) ->
        dbs.should.have.length.at.least 2
        done()
