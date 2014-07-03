angular.module 'myApp.services', ['ngResource']

  .factory 'Order', ['$resource', ($resource) ->
    $resource '/a/order/:id', id: '@id',
      query: method:'GET', isArray:false
  ]
