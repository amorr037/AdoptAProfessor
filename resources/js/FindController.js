aap.controller('FindCtrl', ['$scope', '$http', function($scope, $http) {

    $http.get('./resources/php/find.php').
        success(function(data) {
            console.log(data);
            $scope.professors = data;

        }).
        error(function(data) {
            console.log(data + "error");
        });

    self.pagination = {
        pages:[1],
        commentsPerPage:1,
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
            var comments = self.data;
            var showing = self.data.showing;
            showing.splice(0,showing.length);
            var start = (self.pagination.currPage-1)*self.pagination.commentsPerPage;
            for(var i = start; i<comments.length && i < start+self.pagination.commentsPerPage;i++)
                showing.push(comments[i]);
        }
    };
}])