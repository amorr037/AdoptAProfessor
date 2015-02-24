aap.controller('FindCtrl', ['$http', function($http) {

    $http.get('./resources/php/find.php').
        success(function(data) {
            console.log(data);
        }).
        error(function(data) {
            console.log(data+ "error");
        });
}])