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
