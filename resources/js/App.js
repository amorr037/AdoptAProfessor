//Initialize the panthertext front end app
var aap = angular.module("aap", ['ngRoute']);
aap.user = new User();
function User(){
    var self = this;
    self.username = "";
    self.apiKey = null;
}