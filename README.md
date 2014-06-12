# Express Coffee Project Seed (0.0.3)

This is a Node Express CoffeeScript Stack project template originally based on
http://twilson63.github.io/express-coffee

It comes ready to go with connect-assets that give you the option
to use coffee-script and stylus for the client side.

## Technologies
This is a template that can be used to create nodejs applications using 

* Node v0.10.x
* Express v3.2.x
* CoffeeScript v1.7.x
* Jade v0.30.0
* Stylus v0.32.x 
* bootstrap-stylus 3.1.1 (not a npm module)
* Nib v1.0.x
* Connect Assets v3.0.x
* MongoDB / Mongoose 3.6.x

## Requirements

* [NodeJs](http://nodejs.org)
* [Express](http://expressjs.com)
* [CoffeeScript](http://coffeescript.org)
* [Jade](http://jade-lang.com/)
* [Stylus](http://learnboost.github.io/stylus/)
* [Bower](http://bower.io/)
* [bootstrap-stylus](https://github.com/Acquisio/bootstrap-stylus)
* [Nib](http://visionmedia.github.io/nib/)
* [connect-assets](http://github.com/TrevorBurnham/connect-assets)
* [Mocha](http://visionmedia.github.com/mocha/)
* [Mongoose](https://github.com/LearnBoost/mongoose)

These will install with npm, just do 

```
bower install
npm install
```

In your project directory.

---

## Install, Build, Run, Test, and Watch

```
# Install nodejs and npm

git clone https://github.com/osminogin/express-coffee-seed.git [project-name]
cd [project-name]
npm install
```

## Install coffee-script, mocha and docco

``` sh
npm install coffee-script -g
npm install mocha -g
```

# Run

```
cake dev
```

### Mocha and Request for testing

mocha is an extremely powerful and easy to use testing framework

see [http://visionmedia.github.com/mocha/](http://visionmedia.github.com/mocha/)

    describe 'Sample test', ->
      it 'should be true', ->
        true.should.equal true

to run mocha test suite

    cake test

### Setup to deploy to heroku

    rm -rf .git
    git init
    echo 'node_modules' >> '.gitignore'
    git add .
    git commit -am "first commit"
    heroku create
    git push heroku master
    heroku open


## Thanks to

* [Tom Wilson](https://github.io/twilson63) for original coffee-express template
* [Jeremy Ashkenas](https://github.com/jashkenas) for creating coffee-script
* [TJ Holowaychuk](https://github.com/visionmedia) for creating express
* [Miško Hevery](https://github.com/mhevery) for creating Jasmine-Node
* [TJ Holowaychuk](https://github.com/visionmedia) for creating mocha and should.js

## About

express-coffee-seed is a template or boiler-plate to get started writing 
new express web applications in CoffeeScript.  It comes ready to go with base
setup for an Express Web App.  It includes a Cakefile that lets you build, 
spec, and watch your coffeescript as you develop.

You hack in the ./src folder and run `cake build` to build you server files, 
write your mocha in your ./test folder and run `cake test` or `cake spec` to run 
your test suite.

Create your jade views in the ./views folder and put your public assets in the ./public


## License

See LICENSE

## Contribute

pull requests are welcome
