aap.controller('EditProfileCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$localStorage) {
    var self = this;
    this.user = aap.user;
    self.fname = this.user.firstname;
    self.lname = this.user.lastname;
    self.password = "";
    self.repassword="";
    self.email = this.user.email;
    self.showingHistory = false;
    self.historyBtnName = "Change Password"
    self.toggleShowHistory=function(){
        console.log(self.showingHistory);
        self.showingHistory = !self.showingHistory;
        if(self.showingHistory) this.historyBtnName = "Cancel Password Change";
        else  this.historyBtnName = "Change Password";
    }
    self.updateUserInfo = function(){
        DataRequest.updateUserInfo(self.fname, self.lname,self.email).then(function(data){
            console.log(data);
            if(!data.sucess){
                alert(data.msg);
                return;
            }
            $localStorage.firstname = aap.user.firstname = self.fname;
            $localStorage.lastname = aap.user.lastname = self.lname;
            $localStorage.email = aap.user.email = self.email;
            //alert("Successfully registered. You can login now");
            //$location.path("/login");
        });
    };
}]);/**
 * Created by cruiz on 3/31/15.
 */
