aap.controller('ProfileCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
	var self = this;
    this.user = aap.user;
}]);