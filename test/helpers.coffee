global.request = require('supertest')
global.should = require('chai').should()
global.app = require process.cwd() + '/app'
global.db = app.get 'models'

