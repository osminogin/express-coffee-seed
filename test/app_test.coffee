request = require 'supertest'
app = require process.cwd() + '/.app'


describe 'General', ->
  describe 'Front page', ->
    it "should be here", (done) ->
      request(app)
        .get("/")
        .send("{}")
        .expect(200, done)
  describe '404 Routing', ->
    it 'should not be here', (done) ->
      request(app)
        .get('/nonexistent/action')
        .expect(404, done)
