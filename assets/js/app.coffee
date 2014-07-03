#= require controllers
#= require services

angular.module 'myApp', ['ngRoute'
                         'myApp.services'
                         'myApp.controllers']

  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/home',
        templateUrl: '/partials/home.html'
        controller: 'DemoController'
        controllerAs: 'demo'
      .when '/order',
        templateUrl: '/partials/order-index.html'
        controller: 'OrderController'
      .when '/order/:orderId',
        templateUrl: '/partials/order-detail.html'
        controller: 'DemoController'
      .when '/private',
        templateUrl: '/partials/private.html'
      .otherwise
        redirectTo: '/home'
  ]
