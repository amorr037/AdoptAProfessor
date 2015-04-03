aap.controller('adminPageController', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    var self = this;
    self.user = aap.user;
    self.comments = [];
    self.comments.showing=[];
    self.accountUsername = "";
    self.userAccountInfo = {
        "username" : "",
        "lastname" : "",
        "email" : "",
        "usertype" : "",
        "firstname" : ""
    };
    self.getUserAccount = function() {
        console.log("Getting username account "+self.accountUsername);
        DataRequest.getProfileInfo(self.accountUsername).then(function(data){
            if(!data.sucess){
                console.log(data.errMsg);
                return;
            }
            self.userAccountInfo["username"] = self.accountUsername;
            self.userAccountInfo["firstname"]= data.info.firstname;
            self.userAccountInfo["lastname"]= data.info.lastname;
            self.userAccountInfo["email"] = data.info.email;
            self.userAccountInfo["usertype"] = data.info.usertype;
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