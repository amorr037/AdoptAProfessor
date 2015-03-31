aap.controller('EditProfileCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    var self = this;
    this.user = aap.user;
    self.showingHistory = false;
    self.historyBtnName = "Change Password"
    self.toggleShowHistory=function(){
        console.log(self.showingHistory);
        self.showingHistory = !self.showingHistory;
        if(self.showingHistory) this.historyBtnName = "Cancel Password Change";
        else  this.historyBtnName = "Change Password";
    }
}]);/**
 * Created by cruiz on 3/31/15.
 */
