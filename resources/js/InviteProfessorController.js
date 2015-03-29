aap.controller('InviteProfessorCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    var self = this;
    this.user = aap.user;
    self.message = "";
    self.email = "";
    self.usrErrorMsg=false;
    self.invite = function(){
        DataRequest.invite(self.message, self.email).then(function(data){
            console.log("Invite Response");
            console.log(data);
            //if(!data.sucess){
            //    alert(data.msg);
            //    return;
            //}
            //alert("Successfully registered. You can login now");
            //$location.path("/login");
        });
    };
}]);
