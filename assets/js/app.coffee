angular.module 'myApp', []

  .controller 'DemoController', class
    constructor: (@$location) ->
      @projectName = 'Express Coffee Seed'

    method: ->
      'Method'

    methodWithParam: (param) ->
      "Param: #{param}"

    accessFieldFromMethod: ->
      "Path: #{@$location.absUrl()}"