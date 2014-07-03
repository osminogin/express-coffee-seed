angular.module 'myApp.controllers', []

  .controller 'DemoController', class
    constructor: (@$location) ->
      @projectName = 'Express Coffee Seed'

    method: ->
      'Method'

    methodWithParam: (param) ->
      "Param: #{param}"

    accessFieldFromMethod: ->
      "Path: #{@$location.absUrl()}"

  .controller 'HeaderController', class
    constructor: (@$scope, @$location) ->
      @$scope.isActive = (viewLocation) ->
        viewLocation is $location.path()
