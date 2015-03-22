//Initialize the panthertext front end app
var aap = angular.module("aap", ['ngRoute','ngStorage']);
aap.user = new User();
function User(){
    var self = this;
    self.username = "";
    self.apiKey = null;
    this.isLoggedIn = function(){
    	return self.username && self.username !== "";
    }
    this.clear = function(){
    	self.username = "";
    	self.apiKey = "";
    }
}

aap.controller('NavCtrl', ["$localStorage","$location",function($localStorage,$location) {
	var self = this;
	this.user = aap.user;
	this.user.username = $localStorage.username;
	this.user.apiKey = $localStorage.apiKey;
	this.logout = function(){
		self.user.clear();
		delete $localStorage.username;
		delete $localStorage.apiKey;
		$location.path("/home");
	}
}]);