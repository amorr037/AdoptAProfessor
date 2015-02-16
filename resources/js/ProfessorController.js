aap.controller('ProfessorCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    $scope.professor = function() {

    $http({
        url: "resources/php/Professor.php",
            method: "POST",
            data: { cache: false, username: $scope.username, password: $scope.password },
            headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'} 
        }).success(function(data, status, headers, config) {
            $rootScope.user = data[0];
            $location.path('/dashboard');
        }).error(function(data, status, headers, config) {
            $scope.statusMessage = status;
            alert($scope.errorMessage);
    });
}
}]);
