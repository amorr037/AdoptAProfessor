/**
 * Created by cruiz on 4/16/15.
 */
aap.controller('ProfessorMonthCtrl', ['DataRequest','$location','$timeout', function(DataRequest,$location,$timeout) {
    var self = this;
    self.firstname = null;
    self.lastname = null;
    self.latestComment = null;
    self.email = null;
    self.commentimg = null;
    self.showProfessor = false;
    self.showNoProfessorMessage = false;
    self.profileImg="resources/img/profile/blank-profile.png";
    console.log("Making Request");
    DataRequest.getProfessorOfPreviousMonth().then(function(data){
        if(!data.sucess){
            console.log(data.errMsg);
            return;
        }
        console.log(data.info);
        self.firstname = data.info.firstname;
        self.lastname = data.info.lastname;
        console.log(data.info.profileimg);
        self.email = data.info.email;
        self.updatePrfImg(data.info.profileimg);
        self.getLatestComment(data.info.lastComment, data.info.img);
        if(self.firstname == null){
            self.showNoProfessorMessage = true;
            self.showProfessor = false;
        }else{

            self.showProfessor = true;
            self.showNoProfessorMessage = false;
        }
    });
    self.updatePrfImg = function(img){
        self.profileImg = (img != null)?img:'resources/img/profile/blank-profile.png';
    }
    self.getLatestComment = function(lastComment, img){
        self.latestComment = lastComment;
        self.commentimg = img;
    }
}]);