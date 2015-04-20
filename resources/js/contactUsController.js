/**
 * Created by ayme on 4/19/15.
 */
aap.controller('contactUsController', ['DataRequest', function(DataRequest) {
    var self = this;
    self.email = "";
    self.message = "";
    self.name = "";
    self.emptyErrorMsg=false;
    self.contactUs = function(){
        if(self.email.length==0 || self.message.length==0||self.message.length==0)
            self.emptyErrorMsg=true;
        else {
            self.emptyErrorMsg=false;
            DataRequest.contactUs(self.email, self.name, self.message).then(function (data) {
                console.log(data);
                if (!data.sucess) {
                    alert("Unable to send the message. Please try again!!");
                    return;
                }
                self.email = "";
                self.message = "";
                self.name = "";
                alert("Email sent. Thank you for contacting us!");
            });
        }
    };
}]);