aap.controller('RegisterCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    var self = this;
    this.user = aap.user;
    self.username = "";
    self.password = "";
    self.repassword="";
    self.email = "";
    self.usrErrorMsg=false;
    var promise = null;
    self.register = function(){
        if(self.password.length===0 || self.username.length===0 || self.email.length===0){
            alert("Please fill all the fields");
            return;
        }
        if(self.password!== self.repassword){
            console.log(self.password);
            console.log(self.repassword);
            alert("Passwords mistmatch");
            return;
        }
        DataRequest.register(self.username, self.password, self.email).then(function(data){
            console.log("Register Response");
            console.log(data);
            if(!data.sucess){
                alert(data.msg);
                return;
            }
            alert("Successfully registered. You can login now");
            $location.path("/login");
        });
    };
    self.keyPressed = function(){
        if(promise!==null)
            $timeout.cancel(promise);
        console.log("usrErrorMsg put to false");
        self.usrErrorMsg=false;
        promise=$timeout(checkForUsername, 500);
    };
    var checkForUsername = function(){
         DataRequest.checkUsername(self.username).then(function(data){
            console.log("CheckUsername Response");
            console.log(data);
            if(data.msg!==null)
                self.usrErrorMsg=true;
        });
    };
    
}]);
