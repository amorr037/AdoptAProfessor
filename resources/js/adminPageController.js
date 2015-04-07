aap.controller('adminPageController', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    var self = this;
    self.user = aap.user;
    //account section variables
    self.accountUsername = "";
    self.userAccountInfo = {
        "username" : "",
        "lastname" : "",
        "email" : "",
        "usertype" : "",
        "firstname" : ""
    };
    self.showAccount=false;
    self.accountNotFound=false;
    self.toggleShowBtn=function(){
        self.showingHistory = !self.showingHistory;
        if(self.showingHistory) self.historyBtnName = "Hide History";
        else  self.historyBtnName = "Show History";
    }

    self.getUserAccount = function() {
        console.log("Getting username account "+self.accountUsername);
        DataRequest.getProfileInfo(self.accountUsername).then(function(data){
            if(!data.sucess){
                console.log(data.errMsg);
                return;
            }
            if(data.info.firstname==null){
                self.accountNotFound=true;
                self.showAccount=false;
            }
            else{
                self.showAccount=true;
                self.accountNotFound=false;
                self.userAccountInfo["username"] = self.accountUsername;
                self.userAccountInfo["firstname"]= data.info.firstname;
                self.userAccountInfo["lastname"]= data.info.lastname;
                self.userAccountInfo["email"] = data.info.email;
                self.userAccountInfo["usertype"] = data.info.usertype;
            }
        });
    };
    self.deactivateAccount = function() {
        //console.log("Getting username account "+self.accountUsername);
        //DataRequest.getProfileInfo(self.accountUsername).then(function(data){
        //    if(!data.sucess){
        //        console.log(data.errMsg);
        //        return;
        //    }
        //    self.userAccountInfo["username"] = self.accountUsername;
        //    self.userAccountInfo["firstname"]= data.info.firstname;
        //    self.userAccountInfo["lastname"]= data.info.lastname;
        //    self.userAccountInfo["email"] = data.info.email;
        //    self.userAccountInfo["usertype"] = data.info.usertype;
        //});
    };

    //comments section variables
    self.getCommentId="";
    self.comments = [];
    self.commentNotFound=false;
    self.commentIdFound=false;
    self.showReportedComments = false;
    self.commentInfo = {
        "commentId" : "",
        "from" : "",
        "to" : "",
        "time" : "",
        "content" : "",
        "imageurl":""
    };
    self.getCommentById = function() {
        DataRequest.getCommentById(self.getCommentId).then(function(data){
            if(!data.sucess){
                console.log(data.errMsg);
                return;
            }
            data = data.comments;
            if(data.length==0){
                self.commentNotFound=true;
            }
            else{
                self.commentIdFound=true;
                self.commentInfo.commentId = data[0].commentId;
                self.commentInfo.from = data[0].from;
                self.commentInfo.to = data[0].to;
                self.commentInfo.time = self.dateToString(data[0].time);
                self.commentInfo.content = data[0].content;
                self.commentInfo.imageUrl = data[0].imageurl;
            }
        });
    };
    self.getReportedComments = function() {
        self.comments=[];
        DataRequest.getReportedComments().then(function(data){
            if(!data.sucess){
                console.log(data.errMsg);
                return;
            }
            data = data.comments;
            for(var i = 0 ; i < data.length;i++) {
                self.comments.push(data[i]);
                console.log(data[i]);
            }
            self.showReportedComments=true;
        });
    };
    self.deleteCommentById = function() {
        DataRequest.deleteComment(self.commentInfo.commentId).then(function (data) {
            if (!data.sucess) {
                console.log(data.errMsg);
                return;
            }
            for(var i = 0 ; i < self.comments.length;i++) {
                if(self.comments[i].commentId==self.commentInfo.commentId)
                    self.comments.splice(i,1);
            }
            self.commentIdFound=false;
        });
    }
    self.delete = function(comment, idx) {
        console.log("deleting comment at index", idx);
        DataRequest.deleteComment(comment.commentId).then(function (data) {
            if (!data.sucess) {
                console.log(data.errMsg);
                return;
            }
            if(self.commentInfo.commentId==comment.commentId)
                self.commentIdFound=false;
            self.comments.splice(idx, 1);
        });
    }
    //professors section variables
    self.professorUsername="";
    self.professors = [];
    self.professorNotFound=false;
    self.showProfessor=false;
    self.showNotVerifiedProfessors = false;
    self.professorInfo = {
        "username" : "",
        "lastname" : "",
        "email" : "",
        "usertype" : "",
        "firstname" : "",
        "status":""
    };
    self.getProfessorByUsername = function() {
        DataRequest.getProfessorProfileInfo(self.professorUsername).then(function(data){
            if(!data.sucess){
                console.log(data.errMsg);
                return;
            }
            if(data.info.firstname==null){
                self.professorNotFound=true;
                self.showProfessor=false;
            }
            else {
                self.showProfessor = true;
                self.professorNotFound = false;
                self.professorInfo["username"] = data.info.username;
                self.professorInfo["firstname"] = data.info.firstname;
                self.professorInfo["lastname"] = data.info.lastname;
                self.professorInfo["email"] = data.info.email;
                self.professorInfo["usertype"] = data.info.usertype;
            }
        });
    };
    self.getNotVerifiedProfessors = function() {
        self.professors=[];
        DataRequest.getNotVerifiedProfessors().then(function(data){
            if(!data.sucess){
                console.log(data.errMsg);
                return;
            }
            data = data.accounts;
            for(var i = 0 ; i < data.length;i++) {
                self.professors.push(data[i]);
                console.log(data[i]);
            }
            self.showNotVerifiedProfessors=true;
        });
    };
    self.verifyProfessor = function(professor, idx) {
        console.log("verifying professor at index", idx);
        DataRequest.verifyProfessor(professor.username).then(function (data) {
            if (!data.sucess) {
                console.log(data.errMsg);
                return;
            }
            if(self.professorInfo.username==professor.username)
                self.showProfessor=false;
            self.professors.splice(idx, 1);
        });
    }
    self.verifyProfessorByUsername = function() {
        DataRequest.verifyProfessor(self.professorInfo.username).then(function (data) {
            if (!data.sucess) {
                console.log(data.errMsg);
                return;
            }
            for(var i = 0 ; i < self.comments.length;i++) {
                if(self.professors[i].username==self.professorInfo.username)
                    self.professors.splice(i,1);
            }
            self.commentIdFound=false;
        });
    }
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
}]);