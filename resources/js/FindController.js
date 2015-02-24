aap.controller('FindCtrl', ['$scope', '$http', function($scope, $http) {

    $http.get('./resources/php/find.php').
        success(function(data) {
            console.log(data);
            $scope.professors = data;

        }).
        error(function(data) {
            console.log(data+ "error");
        });
}])