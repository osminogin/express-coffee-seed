request = require 'supertest'
app = require process.cwd() + '/.app'


describe 'Trading', ->
  describe 'Test page', ->
    it "is there", (done) ->
      request(app)
        .get("/")
        .expect(200, done)
