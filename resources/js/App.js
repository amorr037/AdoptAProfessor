//Initialize the panthertext front end app
var aap = angular.module("aap", ['ngRoute','ngStorage']);
aap.user = new User();
function User(){
    var self = this;
    self.username = "";
    self.apiKey = null;
    self.isProfessor = false;
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
	this.logout = function(){
		self.user.clear();
		delete $localStorage.username;
		delete $localStorage.apiKey;
		delete $localStorage.isProfessor;
		delete $localStorage.firstname;
		delete $localStorage.lastname;
		delete $localStorage.email;
		$location.path("/home");
	}
}]);