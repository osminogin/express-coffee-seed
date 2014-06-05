request = require 'supertest'
app = require process.cwd() + '/.app'


describe 'Foobar', ->
  describe 'Test page', ->
    it "is there", (done) ->
      request(app)
        .get('/')
        .send( {} )
        .expect(200, {},
                done
        )
