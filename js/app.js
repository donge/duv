var example = angular.module("links", []);

example.controller("linksController", function($scope, $http) {
    $http.get('./links.json').success(function(data) {
      $scope.links = data;
      //alert($scope.prs.data[0].name);
    });
});
