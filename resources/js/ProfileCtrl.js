aap.controller('ProfileCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
	var self = this;
    this.user = aap.user;
    self.showingHistory = false;
    self.historyBtnName = "Show History"
    self.comments = [];
    self.toggleShowHistory=function(){
        self.showingHistory = !self.showingHistory;
        if(self.showingHistory) this.historyBtnName = "Hide History";
        else  this.historyBtnName = "Show History";
    }
}]);