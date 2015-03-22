aap.controller('LoginCtrl', ['DataRequest','$location','$localStorage', function(DataRequest,$location,$localStorage) {
    var self = this;
    this.user = aap.user;
    self.username = "";
    self.password = "";
    self.login = function(){
        DataRequest.login(self.username, self.password).then(function(data){
            console.log("Login Response");
            console.log(data);
            if(!data.sucess){
                alert(data.msg);
                return;
            }
            aap.user.apiKey = data.apiKey;
            aap.user.username = self.username;
            $localStorage.username = aap.user.username;
            $localStorage.apiKey = aap.user.apiKey;
            console.log(aap.user);
            //redirect to some page
            $location.path("/profile");
        });
    };
}]);