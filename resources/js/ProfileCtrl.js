aap.controller('ProfileCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
	var self = this;
    this.user = aap.user;
    self.username = aap.user.username;
    self.firstname = "";
    self.lastname="";
    self.email = "";
        DataRequest.getProfileInfo(aap.user.username).then(function(data){
            console.log("getProfileInfo Response");
            console.log(data);
            self.firstname = data.info.firstname;
            self.lastname = data.info.lastname;
            self.email = data.info.email;
        });

}]);