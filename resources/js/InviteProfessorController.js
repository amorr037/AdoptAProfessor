aap.controller('InviteProfessorCtrl', ['DataRequest', function(DataRequest) {
    var self = this;
    this.user = aap.user;
    self.username = self.user.username;
    self.email = "";
    self.message = "";
    self.inviteNewProfessor = function(){
        DataRequest.inviteNewProfessor(self.email, self.message).then(function(data){

            console.log(data);
            if(!data.sucess){
                alert("An error has occur!\nDisregard any possible received email!");
                return;
            }
            alert("An email has been sent to your new professor!");
        });
    };
}]);