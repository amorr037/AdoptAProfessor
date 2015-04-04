aap.controller('forgotPasswordCtrl', ['DataRequest', function(DataRequest) {
    var self = this;
    this.user = aap.user;
    self.username = "";
    self.requestNewPassword = function(){
        console.log("check if username ["+self.username+"] is valid!");
        DataRequest.requestNewPassword(self.username).then(function(data){
            console.log(data);
            if(!data.sucess){
                alert(data.msg);
                return;
            }
        });
    };
}]);