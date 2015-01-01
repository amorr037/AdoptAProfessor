aap.controller('LoginCtrl', ['DataRequest','$location', function(DataRequest,$location) {
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
            console.log(aap.user);
            //redirect to some page
            $location.path("/");
        });
    };
}]);