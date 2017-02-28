app = angular.module('tramites', ['ngRoute','ngResource']).config(
    function ($routeProvider, $httpProvider, $interpolateProvider) {
        $interpolateProvider.startSymbol('[[');
        $interpolateProvider.endSymbol(']]');

        $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
        $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    }
);

app.factory("Tramites", function($resource) {
  return $resource("/api/tramites/:id");
});

app.controller("TramitesIndexCtrl", function($scope) {
    $scope.saludo = "Holis";
});
