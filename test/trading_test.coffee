request = require 'supertest'
app = require process.cwd() + '/.app'


describe 'Trading 3', ->
  describe 'Test page 2', ->
    it "is there", (done) ->
      request(app)
        .get("/")
        .send("{}")
        .expect(200, done)
