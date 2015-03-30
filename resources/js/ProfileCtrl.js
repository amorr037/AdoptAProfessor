aap.controller('ProfileCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
	var self = this;
    this.user = aap.user;
    self.showingHistory = false;
    self.historyBtnName = "Show History"
    self.comments = [];
    self.comments.showing=[];
    self.toggleShowHistory=function(){
        self.showingHistory = !self.showingHistory;
        if(self.showingHistory) this.historyBtnName = "Hide History";
        else  this.historyBtnName = "Show History";
    }
    self.editProfile = function(){
        $location.path("/editProfile");
    };
    self.report = function(comment) {
        console.log("Reporting commentid "+comment.commentId);
        DataRequest.reportComment(comment.commentId).then(function(data){
            if(!data.sucess){
                console.log(data.errMsg);
                return;
            }
            comment.reported = true;
        });
    };
    self.dateToString = function (timestamp){
        var date = new Date(timestamp);
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var militaryHour = date.getHours();
        var hours = militaryHour;
        var minutes = date.getMinutes();
        var seconds = date.getSeconds();
        var ampm = 'AM';
        if(militaryHour>12){
            ampm = 'PM';
            hours = militaryHour % 12;
        }
        var hourStr = hours<10?'0'+hours:''+hours;
        var minuteStr = minutes<10?'0'+minutes:''+minutes;
        var secondStr = seconds<10?'0'+seconds:''+seconds;
        return month+"/"+day+"/"+year+" - "+hourStr+":"+minuteStr+":"+secondStr+" "+ampm;
    };
    self.pagination = {
        pages:[1],
        commentsPerPage:5,
        currPage:1,
        pagesAvailable:1,
        next:function(){
            if(self.pagination.currPage<self.pagination.pagesAvailable){
                self.pagination.currPage += 1;
                self.pagination.setShowing();
            }
        },
        previous:function(){
            if(self.pagination.currPage>1){
                self.pagination.currPage -= 1;
                self.pagination.setShowing();
            }
        },
        hasNext:function(){
            return self.pagination.currPage<self.pagination.pagesAvailable;
        },
        hasPrevious:function(){
            return self.pagination.currPage>1;
        },
        setPage: function(page){
            self.pagination.currPage = page;
            self.pagination.setShowing();
        },
        setShowing: function(){
            var comments = self.comments;
            var showing = self.comments.showing;
            showing.splice(0,showing.length);
            var start = (self.pagination.currPage-1)*self.pagination.commentsPerPage;
            for(var i = start; i<comments.length && i < start+self.pagination.commentsPerPage;i++)
                showing.push(comments[i]);
        }
    };
    DataRequest.getStudentComments().then(function(data){
        console.log(data);
        if(!data.sucess){
            console.log(data.errMsg);
            return;
        }
        data = data.comments;
        for(var i = 0 ; i < data.length;i++){
            self.comments.push(data[i]);
            if(self.comments.length>1 && (self.comments.length-1)%self.pagination.commentsPerPage==0){
                self.pagination.pages.push(self.pagination.pages.length+1);
            }
        }
        self.pagination.pagesAvailable = Math.ceil(self.comments.length/self.pagination.commentsPerPage);
        self.pagination.setShowing();
    });
}]);