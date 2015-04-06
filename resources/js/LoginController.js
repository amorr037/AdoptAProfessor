aap.controller('LoginCtrl', ['DataRequest','$location','$localStorage', function(DataRequest,$location,$localStorage) {
    var self = this;
    this.user = aap.user;
    self.username = "";
    self.password = "";
    self.usrErrorMsg=false;
    self.login = function(){
        DataRequest.login(self.username, self.password).then(function(data){
            console.log("Login Response");
            console.log(data);
            if(!data.sucess){
                self.usrErrorMsg=true;
                return;
            }
            self.usrErrorMsg=false;
            aap.user.apiKey = data.apiKey;
            aap.user.username = self.username;
            $localStorage.username = aap.user.username;
            $localStorage.apiKey = aap.user.apiKey;
            getUserInfo();
        });
    };
    function getUserInfo(){
        DataRequest.getProfileInfo(aap.user.username).then(function(data){
            console.log("getProfileInfo Response");
            console.log(data);
            $localStorage.firstname = self.user.firstname = data.info.firstname;
            $localStorage.lastname = self.user.lastname = data.info.lastname;
            $localStorage.email = self.user.email = data.info.email;
            $localStorage.isProfessor = self.user.isProfessor = data.info.usertype == "PROFESSOR";
            $localStorage.isAdmin = self.user.isAdmin = data.info.usertype == "ADMINISTRATOR";
            console.log(aap.user);
            $location.path("/profile");
        });
    }
    self.forgotPasswordPage = function(){
        $location.path("/forgotPassword");
    }
}]);