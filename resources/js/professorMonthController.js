/**
 * Created by cruiz on 4/16/15.
 */
aap.controller('ProfessorMonthCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    var self = this;
    self.user = aap.user;
    self.latestComment = null;
    self.profileImg="";
    self.profileImg=self.user.profileImgPath==null?'resources/img/profile/blank-profile.png':self.user.profileImgPath;
}]);