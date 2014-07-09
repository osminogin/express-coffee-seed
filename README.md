# Express Coffee Project Seed (0.4.3)

[![Build Status](https://travis-ci.org/osminogin/express-coffee-seed.svg?branch=master)](https://travis-ci.org/osminogin/express-coffee-seed)
[![Dependency Status](https://gemnasium.com/osminogin/express-coffee-seed.png)](https://gemnasium.com/osminogin/express-coffee-seed)

This is a Node.js Express CoffeeScript stack project seed originally based on
[Tom Wilson coffee-express template](https://github.io/twilson63), but use
Sequelize as database ORM (working with MySQL, MariaDB, SQLite and PostgreSQL 
databases).

It comes ready to go with connect-assets that give you the option
to use coffee-script and stylus for the client side. (This feature temporarily 
disabled for much quickly tests passing)

## Technologies

This is a boilerplate that can be used to create nodejs applications using 

* Node v0.10.x
* Express v4.5.x
* CoffeeScript v1.7.x
* Sequelize v1.7.x
* Bootstrap 3.2.x (not a npm module)
* Connect Assets v3.0.x
* Angular v1.2.x
* Jade v1.3.1

## Requirements

* [Node.js](http://nodejs.org)
* [Express](http://expressjs.com)
* [CoffeeScript](http://coffeescript.org)
* [Bower](http://bower.io/)
* [Mocha](http://visionmedia.github.com/mocha/)
* [Sequelize](http://sequelizejs.com/)
* [connect-assets](http://github.com/TrevorBurnham/connect-assets)
* [Bootstrap](https://github.com/twbs/bootstrap)
* [AngularJS](https://angularjs.org)
* [Jade](http://jade-lang.com/)

These requirements will install with NPM and Bower, just do 

```bash
$ bower install
$ npm install
```

In your project directory.

---

## Install, Build, Run, Test, and Watch

# Install nodejs and npm

```bash
$ git clone https://github.com/osminogin/express-coffee-seed.git [project-name]
$ cd [project-name]
$ npm install
```

## Install coffee-script and mocha

```bash
$ npm install -g coffee-script
$ npm install -g mocha
```

# Start server

```bash
$ cake run
```

### Mocha and Request for testing

mocha is an extremely powerful and easy to use testing framework

see [http://visionmedia.github.com/mocha/](http://visionmedia.github.com/mocha/)

```coffeescript
describe 'Sample test', ->
  it 'should be true', ->
    true.should.equal true
```

to run mocha test suite

```bash
$ cake test
```

### Setup to deploy to heroku

```bash
rm -rf .git
git init
echo 'node_modules' >> '.gitignore'
git add .
git commit -am "first commit"
heroku create
git push heroku master
heroku open
```

## Thanks to

* [Tom Wilson](https://github.io/twilson63) for original coffee-express template
* [Jeremy Ashkenas](https://github.com/jashkenas) for creating Coffee Script
* [Miško Hevery](https://github.com/mhevery) for creating Jasmine-Node
* [TJ Holowaychuk](https://github.com/visionmedia) for creating express, mocha and should

## About

express-coffee-seed is a template or boilerplate to get started writing 
new express web applications in Coffee Script.  It comes ready to go with base
setup for an Express Web App.  

It includes a Cakefile that lets you build, test, and watch Coffee Scripts as you develop.

You hack in the ./src folder and run `cake build` to build you server files, 
write your mocha tests in your ./test folder and run `cake test` to run your test suite.

Create your jade views in the ./views folder and put your public assets in the ./public

## License

MIT
