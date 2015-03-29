aap.controller('ProfessorProfileCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    var self = this;
    self.user = aap.user;
    self.verified = true;
    self.comments = [];
    self.editProfile = function(){
        $location.path("/editProfile");
    };
}]);