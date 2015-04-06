aap.controller('EditProfileCtrl', ['DataRequest','$location','$timeout', '$localStorage', function(DataRequest,$location,$timeout,$localStorage) {
    var self = this;
    this.user = aap.user;
    self.fname = this.user.firstname;
    self.lname = this.user.lastname;
    self.oldpassword = "";
    self.newpassword = "";
    self.reNewPassword="";
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
        });
    };
    self.changePasswordRequest = function(){
        console.log("oldPassword: ["+self.oldpassword+"]" +
        "\nnewPassword: ["+self.newpassword+"]" +
        "\nrepeat new password:["+self.reNewPassword+"]");
        if(self.oldpassword.length == 0 || self.newpassword.length == 0 || self.reNewPassword.length == 0){
            alert("Please complete all the fields before changing your password!");
            return;
        }else if(self.newpassword != self.reNewPassword){
            alert("New password must be the same for both fields!");
            return;
        }else if(self.oldpassword == self.newpassword){
            alert("Old password can't be the same as New password!");
            return;
        }
        DataRequest.changePasswordRequest(self.oldpassword, self.newpassword, self.reNewPassword).then(function(data){
           console.log(data);
            if(!data.sucess){
                alert("Old password is incorrect!");
                return;
            }
            alert("Password Succesfully changed!");
            document.getElementById('edit-old-password').value = '';
            document.getElementById('edit-password').value = '';
            document.getElementById('edit-password2').value = '';
            self.oldpassword = "";
            self.newpassword = "";
            self.reNewPassword="";
        });
    };
}]);
/**
 * Created by cruiz on 3/31/15.
 */
