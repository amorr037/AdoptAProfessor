/**
 * A request factory for the different types of requests that the app requieres
 * @param string factoryName The name of the factory
 * @param factory The function that defines all types of requests
 */
aap.factory('DataRequest', function($http) {
    var self = this;
    //Setup the format for all http request
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
    /**
     * Parses a server response into a javascript readable object
     * @param string result The server's response
     * @returns {Array|Object|Boolean} False if invalid response or the server's response as an object
     */
    self.parseResponse = function(result) {
        //if the response is not a string it means that it has been interpreted as a javascript object already
        if (typeof result.data === 'string') {//if response is a string
            var jsonResponse;
            try {
                jsonResponse = JSON.parse(result.data);//try to parse the string into a javascript object (json)
            } catch (err) {//if could not parse the string
                console.log("invalid json response:");//the server gave us something unexpected
                console.log(result.data+"\n");//log the data
                jsonResponse = false;//specify invalid server response
            }
            return jsonResponse;
        }
        return result.data;
    };
    /**
     * Makes a request to the server app with the specified parameters
     * @param string appUrl The url to the app
     * @param string params String with the parameters
     * @returns The server response as a json object. True if valid, False if invalid, String if error message.
     */
    self.POST = function(url, params){
        return $http.post(url, params);
    };

    self.GET = function(url) {
        return $http.get(url);
    };

    // Legacy compatability
    self.makeRequest = function(url, params) {
        return $http.post(url, params)//Make request
            .then(function(result) {//Server response in the result variable
                return self.parseResponse(result);//parse the response into javascript
            });
    };

    //functions to make the requests
    return {
        dummy: function() {
            return self.makeRequest("some/url", "arg1=value1" + "&arg2=value2");
        },
        login: function(username,password) {
            return self.makeRequest("resources/php/login.php", 
            "username="+username + "&password="+password);
        },
        register: function(username,password, email, fname, lname, userType) {
            var usertype = userType?"PROFESSOR":"STUDENT";
            return self.makeRequest("resources/php/register.php", 
            "username="+username + "&password="+password + "&email="+email + "&fname="+fname + "&lname="+lname +
            "&usertype="+usertype);
        },
        getProfileInfo: function(username) {
            return self.makeRequest("resources/php/getProfileInfo.php", 
            "username="+username);
        },
        checkUsername: function(username,password, email) {
            return self.makeRequest("resources/php/checkUsername.php", 
            "username="+username);
        },
        getProfessorComments: function(username){
            if(!username) username = aap.user.username;
            return self.makeRequest("resources/php/getProfessorComments.php","username="+username);
        },
        getProfessors: function(){
            return self.makeRequest("resources/php/find.php");
        },
        getStudentComments: function(username){
            if(!username) username = aap.user.username;
            return self.makeRequest("resources/php/getStudentComments.php","username="+username);
        },
        reportComment: function(commentId){
            return self.makeRequest("resources/php/reportComment.php",
                "username="+aap.user.username+"&commentId="+commentId);
        },
        deleteComment: function(commentId) {
            return self.makeRequest("resources/php/deleteComment.php",
                "commentId=" + commentId);
        },
        updateUserInfo: function(firstName,lastName,email){
            return self.makeRequest("resources/php/editProfile.php",
                "username="+aap.user.username+"&firstname="+firstName+"&lastname="+lastName+"&email="+email);

        },
        getCommentById: function(commentId){
            return self.makeRequest("resources/php/getCommentById.php", "commentId="+commentId);
        },
        getReportedComments: function(){
            return self.makeRequest("resources/php/getReportedComments.php");
        },
        getProfessorProfileInfo: function(username){
            return self.makeRequest("resources/php/getProfessorProfileInfo.php","username="+username);
        },
        getNotVerifiedProfessors: function(){
            return self.makeRequest("resources/php/getNotVerifiedProfessors.php");
        },
        requestNewPassword: function(username){
            return self.makeRequest("resources/php/requestNewPassword.php",
                "username=" + username);
        },
        inviteNewProfessor: function(email, message){
            return self.makeRequest("resources/php/inviteNewProfessor.php",
                 "email=" + email, 'message=' +message);
        },
        changePasswordRequest: function(oldpassword, newpasswrod){
            return self.makeRequest("resources/php/changePasswordRequest.php",
                "username="+aap.user.username+"&oldpassword="+oldpassword+"&newpasswrod="+newpasswrod);
        },
        verifyProfessor: function(username){
            return self.makeRequest("resources/php/verifyProfessor.php",
                "username="+username);
        },
        deleteUser: function(username){
            return self.makeRequest("resources/php/deleteUser.php","username="+username);
        },
        getProfessorOfPreviousMonth: function() {
            return self.makeRequest("resources/php/getProfessorOfPreviousMonth.php");
        },
        contactUs: function(email, name, comment){
            return self.makeRequest("resources/php/contactUs.php","email="+email+"&name="+name+"&comment="+comment);
        }
    };
});