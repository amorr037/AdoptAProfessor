aap.controller('forgotPasswordCtrl', ['DataRequest','$location','$localStorage', function(DataRequest) {
    var self = this;
    this.user = aap.user;
    self.username = "";
    self.password = "";
    self.usrErrorMsg=false;
    self.requestNewPassword = function(){
        console.log("Login Response");
    };
}]);