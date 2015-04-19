(function(){
  var app = angular.module("humane_hr", []);

  app.service('NewsSrvc', function($http, $log, $q){
    
    var srvc = this;
    var url = "/news/list.json"
  
    this.getNews = function(){
      return $http.get(url)
        .then(
          function(response){
            srvc.articles = response.data;
            return response.data;
          });
    };
    
    this.getNews();
  
  });
  
  app.controller('NewsCtrl', function($scope, NewsSrvc){
    
    this.news = NewsSrvc;
    
  });
}());