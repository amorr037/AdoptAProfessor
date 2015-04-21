aap.controller('visitorProfileController', ['DataRequest','$location','$timeout','$scope','$upload','$routeParams','$sce', function(DataRequest,$location,$timeout,$scope,$upload,$routeParams,$sce) {
    var self = this;
    self.user = aap.user;
    self.comments = [];
    self.comments.showing=[];
    self.file = null;
    self.profileUsername = $routeParams.user;
    self.profileFName="";
    self.profileLName="";
    self.profileType="";
    self.profileEmail="";
    self.profileImgPath="";
    self.professorVerified=0;
    self.professorProfile=false;
    self.addedComment="";
    self.emptyErrorMsg=false;
    self.showImg=false;
    self.profileImg="";

    DataRequest.getProfileInfo(self.profileUsername).then(function(data){
        if(!data.sucess){
            console.log(data.errMsg);
            return;
        }
        self.profileFName=data.info.firstname;
        self.profileLName=data.info.lastname;
        self.profileEmail=data.info.email;
        self.profileType=data.info.usertype;
        self.professorVerified=data.info.status;
        self.profileImgPath = data.info.profileImgPath;
        self.professorProfile=(data.info.usertype=="PROFESSOR");
        getComments();
        getProfileImg();

    });
    $scope.onFileSelect = function($files) {
        if ($files && $files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL($files[0]);
            self.file = $files[0];
            self.showImg=true;
        }
    };
   function getProfileImg(){
        self.profileImg = self.profileImgPath==null?'resources/img/profile/blank-profile.png':self.profileImgPath
       console.log(self.profileImg);
    }
    self.uploadImg = function(){
        //console.log(self.addedComment);
        if(self.file===null && self.addedComment==="")
            self.emptyErrorMsg=true;
       else{
            self.emptyErrorMsg=false;
            console.log(self.addedComment);
           $upload.upload({
               url: "resources/php/uploadImg.php",
               data:  {text: self.addedComment,from:self.user.username,to:self.profileUsername},
               file: self.file
           }).success(function(data) {
               self.addedComment="";
               self.showImg=false;
                getComments();
               //console.log(data);
           });
       }
    }
    function imageIsLoaded(e) {
        $('#myImg').attr('src', e.target.result);
    };
    function getComments(){
        if(self.professorProfile){
            DataRequest.getProfessorComments(self.profileUsername).then(function(data){
                console.log(data);
                if(!data.sucess){
                    console.log(data.errMsg);
                    return;
                }
                setupComments(data);
            });
        }
        else{
            DataRequest.getStudentComments(self.profileUsername).then(function(data){
                console.log(data);
                if(!data.sucess){
                    console.log(data.errMsg);
                    return;
                }
                setupComments(data);
            });
        }
    }
    function setupPagination(){
        self.pagination.pagesAvailable = Math.ceil(self.comments.length/self.pagination.commentsPerPage);
        self.pagination.setShowing();
    }
    function setupComments(data){
        self.comments.splice(0,self.comments.length);
        data = data.comments;
        for(var i = 0 ; i < data.length;i++){
            //var comment = data[i];
            //comment.content= $sce.trustAsHtml(comment.content);
            self.comments.push(data[i]);
            if(self.comments.length>1 && (self.comments.length-1)%self.pagination.commentsPerPage==0){
                self.pagination.pages.push(self.pagination.pages.length+1);
            }
        }
        setupPagination();
    }

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

}]);