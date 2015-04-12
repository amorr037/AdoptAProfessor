//Initialize the panthertext front end app
var aap = angular.module("aap", ['ngRoute','ngStorage','angularFileUpload']);
aap.user = new User();
function User(){
    var self = this;
    self.username = "";
    self.apiKey = null;
    self.isProfessor = false;
    self.isAdmin = false;
    self.firstname = "";
    self.lastname="";
    self.email = "";
    this.isLoggedIn = function(){
    	return self.username && self.username !== "";
    }
    this.clear = function(){
    	self.username = "";
    	self.apiKey = "";
    	self.isProfessor = false;
        self.isAdmin = false;
    	self.firstname = "";
    	self.lastname = "";
    	self.email = "";
    }
}

aap.controller('NavCtrl', ["$localStorage","$location",function($localStorage,$location) {
	var self = this;
	this.user = aap.user;
	this.user.username = $localStorage.username;
	this.user.apiKey = $localStorage.apiKey;
	this.user.firstname = $localStorage.firstname;
	this.user.lastname = $localStorage.lastname;
	this.user.email = $localStorage.email;
    this.user.status=$localStorage.status;
    this.user.isProfessor = $localStorage.isProfessor;
    this.user.isAdmin = $localStorage.isAdmin;
    this.user.profileImgPath = $localStorage.profileImgPath;
	this.logout = function(){
		self.user.clear();
		delete $localStorage.username;
		delete $localStorage.apiKey;
		delete $localStorage.isProfessor;
        delete $localStorage.isAdmin;
		delete $localStorage.firstname;
		delete $localStorage.lastname;
		delete $localStorage.email;
        delete $localStorage.status;
        delete $localStorage.profileImgPath;
		$location.path("/home");
	};

    this.getHomeAddress = function(){
        return self.user.isLoggedIn()?'profile':'home';
    };

}]);

aap.filter('slice', function() {
    return function(arr, start, end) {
        return (arr || []).slice(start, end);
    };
});

aap.directive('contenteditable', function() {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            // view -> model
            elm.bind('blur', function() {
                scope.$apply(function() {
                    ctrl.$setViewValue(elm.html());
                });
            });

            // model -> view
            ctrl.$render = function() {
                elm.html(ctrl.$viewValue);
            };

            // load init value from DOM
            ctrl.$setViewValue(elm.html());
        }
    };
});