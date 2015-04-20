/**
 * Created by ayme on 4/19/15.
 */
aap.controller('contactUsController', ['DataRequest', function(DataRequest) {
    var self = this;
    self.email = " ";
    self.message = " ";
    self.name = " ";
    self.contactUs = function(){
        console.log(self.email);
        console.log(self.name);
        console.log(self.message);
        DataRequest.contactUs(self.email, self.name, self.message).then(function(data){
            console.log(data);
            if(!data.sucess){
                alert("Unable to send the message. Please try again!!");
                return;
            }
            alert("Email sent. Thank you for contacting us!");
        });
    };
}]);