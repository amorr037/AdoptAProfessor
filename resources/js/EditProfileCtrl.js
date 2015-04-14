aap.controller('EditProfileCtrl', ['DataRequest','$location','$timeout', '$localStorage','$scope', '$upload', function(DataRequest,$location,$timeout,$localStorage,$scope, $upload) {
    var self = this;
    this.user = aap.user;
    self.fname = this.user.firstname;
    self.lname = this.user.lastname;
    self.oldpassword = "";
    self.newpassword = "";
    self.reNewPassword="";
    self.email = this.user.email;
    self.showingHistory = false;
    self.showingApplyImg = false;
    self.profileImg = null;
    self.historyBtnName = "Change Password";
    getProfileImg();
    self.toggleShowHistory=function(){
        console.log(self.showingHistory);
        self.showingHistory = !self.showingHistory;
        if(self.showingHistory) this.historyBtnName = "Cancel Password Change";
        else  this.historyBtnName = "Change Password";
    }
    function getProfileImg(){
        DataRequest.downloadPrfImg(aap.user.username).then(function(data){
            if(!data.success()){
                console.log(data);
                self.profileImg = NULL;
            }
            console.log(data);
            self.profileImg = data;
        });
        if(self.profileImg==null){
            $('#profileImg').attr('style', "background-image: url(resources/img/profile/blank-profile.png)");
            self.profileImg = 'resources/img/profile/blank-profile.png';
        }else{
            $('#profileImg').attr('style', "background-image: url("+self.profileImg+")");
            self.profileImg = self.profileImgPath;
        }
        //self.profileImg = self.profileImgPath==null?'resources/img/profile/blank-profile.png':self.profileImgPath
        console.log(self.profileImg);
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
    $scope.onFileSelect = function($files) {
        if ($files && $files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL($files[0]);
            self.file = $files[0];
            console.log(self.file);
            self.showingApplyImg = true;
        }
    };
    function imageIsLoaded(e) {
        $('#profileImg').attr('style', "background-image: url("+e.target.result+")");
    };
    self.uploadPrfImg = function(){
        $upload.upload({
            url: "resources/php/uploadPrfImg.php",
            data:  {username: aap.user.username},
            file: self.file
        }).success(function(data) {
            alert("Profile image changed!");
        });
    }
}]);
/**
 * Created by cruiz on 3/31/15.
 */
