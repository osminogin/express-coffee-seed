#= require controllers
#= require services

angular.module 'myApp', ['ngRoute'
                         'myApp.services'
                         'myApp.controllers']

  # Routes
  .config ($routeProvider) ->
    $routeProvider
      .when '/home',
        templateUrl:  '/partials/home'
        controller:   'DemoController'
        controllerAs: 'demo'
      .when '/signup',
        templateUrl:  '/partials/user-signup'
#        controller:  'SignupController'
      .when '/login',
        templateUrl:  '/partials/user-login'
#        controller:  'UserLoginController'
      .when '/profile',
        templateUrl:  '/partials/user-profile'
      .when '/private',
        templateUrl:  '/partials/401'
      .otherwise
        redirectTo:   '/home'

  # Catch site errors
  .config ($httpProvider) ->
    $httpProvider.interceptors.push ($q, $location) ->
      'response': (response) -> response
      'responseError': (rejection) ->
        $location.path '/private' if rejection.status is 401
        $q.reject(rejection)
