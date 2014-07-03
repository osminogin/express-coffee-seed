#= require controllers

angular.module 'myApp', ['ngRoute'
                         'myApp.controllers']

  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/home',
        templateUrl: '/partials/home.html'
        controller: 'DemoController'
        controllerAs: 'demo'
      .otherwise
        redirectTo: '/home'
  ]

  .controller 'HeaderController', class
    constructor: (@$scope, @$location) ->
      @$scope.isActive = (viewLocation) ->
        viewLocation is $location.path()
