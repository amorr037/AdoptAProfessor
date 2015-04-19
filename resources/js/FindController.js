aap.controller('FindCtrl', ['DataRequest', '$scope', '$filter', '$localStorage', function(DataRequest, $scope, $filter) {
    var self = this;
    self.professors = [];
    self.professors.showing=[];
    self.user = aap.user;

    //$scope.user = self.user.username;
    $scope.isLoggedIn = isLoggedIn();

    function isLoggedIn(){
        return !angular.isUndefined(self.user.username);
    }
    $scope.$watch('query', function(val) {
        DataRequest.getProfessors().then(function(data){
            //console.log(data);
            if(!data) {
                console.log(data);
                return;
            }

            //reset data
            self.professors = [];
            self.professors.showing=[];

            //reset pagination
            self.pagination.pages=[1];
            self.pagination.professorsPerPage = 5;
            self.pagination.currPage =1;
            self.pagination.pagesAvailable =1;

            console.log(data);
            console.log(self.professors);
            data = $filter('filter')(data, val);
            for(var i = 0 ; i < data.length;i++){
                self.professors.push(data[i]);
                if(self.professors.length>1 && (self.professors.length-1)%self.pagination.professorsPerPage==0){
                    self.pagination.pages.push(self.pagination.pages.length+1);
                }
            }
            setupPagination();
        });
    });

    self.pagination = {
        pages:[1],
        professorsPerPage:5,
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
            var professors = self.professors;
            var showing = self.professors.showing;

            showing.splice(0,showing.length);
            var start = (self.pagination.currPage-1)*self.pagination.professorsPerPage;
            for(var i = start; i<professors.length && i < start+self.pagination.professorsPerPage;i++)
                showing.push(professors[i]);
        }
    };

    function setupPagination(){
        self.pagination.pagesAvailable = Math.ceil(self.professors.length/self.pagination.professorsPerPage);
        self.pagination.setShowing();
    }
}])