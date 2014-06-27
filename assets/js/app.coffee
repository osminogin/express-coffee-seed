angular.module 'myApp', []

  .controller 'DemoController', class
    constructor: (@$location) ->
      @field = 'Demo'

    method: ->
      'Method'

    methodWithParam: (param) ->
      "Param: #{param}"

    accessFieldFromMethod: ->
      "Path: #{@$location.absUrl()}"