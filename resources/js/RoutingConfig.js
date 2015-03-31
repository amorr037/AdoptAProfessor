/**
 * This establishes the mapping from the address after # in the URL to a partial
 * page in the partials file. The content of the partials file goes in the
 * <ng-view> element of index.html
 * @param array Array with the $routeProvider variable from angular
 */
aap.config(['$routeProvider','$locationProvider', function($routeProvider, $locationProvider) {
//        $locationProvider.html5Mode(true);
    //The content in the when clause is to be matched to the content of the
    //url after the '#' character ex. http://panthertext.com/#/home
    $routeProvider.
        when('/login',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/login.html";
            }
        }).when('/register',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/register.html";
            }
        }).when('/home',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/home.html";
            }
        }).when('/find',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/find.html";
            }
        }).when('/inviteProfessor',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/inviteProfessor.html";
            }
        }).when('/contactUs',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/contactUs.html";
            }
        }).when('/faq',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/faq.html";
            }
        })
        .when('/professorMonth',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/professorMonth.html";
            }
        }).when('/admin',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/administratorPage.html";
            }
        }).when('/editProfile',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/editProfile.html";
            }
        }).when('/viewProfile',//Redirect if root
        {
            templateUrl: function(){
                return "./resources/pages/viewUserProfile.html";
            }
        }).when('/profile',//Redirect if root
        {
            templateUrl: function(){
                if(aap.user.isAdmin)
                    return "./resources/pages/administratorPage.html";
                return "./resources/pages/"+(aap.user.isProfessor?"professorProfile.html":"profile.html");
            }
        }).otherwise({
            redirectTo: (function() {
                return function(){
                    return "/home";
                };
            })()
        });
}]);