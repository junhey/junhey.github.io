var app = angular.module('app', ['ngRoute']);
function routeConfig($routeProvider){
	$routeProvider
	.when('/',{controller:'IndexController',templateUrl:'index.html'})
	.when('/topic/:id',{controller:'TopicController',templateUrl:'topic.html'})
	.when('/user/:name',{controller:'UserController',templateUrl:'user.html'})
	.when('/about',{controller:'AboutController',templateUrl:'about.html'})
	.otherwise({redirectTo:'/'});
};
app.config(routeConfig);
app.directive("scroll",  ["$window", "$document",function ($window, $document) {
    return function(scope, element) {
        angular.element($window).bind("scroll", function() {
            var pageYOffset = $window.pageYOffset;
            var clientHeight = $document[0].documentElement.clientHeight;
            var offsetHeight = $document[0].body.offsetHeight;
            //当滚动到90%的时候去加载
            if(pageYOffset+clientHeight>offsetHeight*0.9)
            {

                //scope.shopWorkCanLoad是否可加载,controller中定义
                //scope.shopWorkOnLoad是否正在加载,controller中定义
                if(scope.shopWorkCanLoad==true && scope.shopWorkOnLoad==false){
                    //加载数据,controller中定义
                    scope.loadShopWork();//
                }
            }
        });
    };
}]);

app.controller('IndexController',function($scope,$http,$sce,$location){
	$scope.trustAsHtml = function (str) {
		var _str  = angular.element(str);
		var codes = _str.find('pre');
		for(var i = 0; i< codes.length; i++) {
			hljs.highlightBlock(codes[i]);
		}
		var html = _str[0] ? _str[0].innerHTML : null;
		return $sce.trustAsHtml(html);
	};
   
	function init(){
		$http({
			url: 'https://cnodejs.org/api/v1/topics',
			cache: true
		}).success(function (response) {
			//console.log(response.data);
			$scope.lists = response.data;
		});
		$scope.back=false;
		
	}	
	init();
	$scope.toTopic=function(id){
		$location.path('topic/'+id);
	}
	$scope.toAbout=function(){
		$location.path('about');
	}
})
app.controller('TopicController',function($scope,$http,$routeParams,$sce,$location){
	$scope.trustAsHtml = function (str) {
		var _str  = angular.element(str);
		var codes = _str.find('pre');
		for(var i = 0; i< codes.length; i++) {
			hljs.highlightBlock(codes[i]);
		}
		var html = _str[0] ? _str[0].innerHTML : null;
		return $sce.trustAsHtml(html);
	};
	function init(){
		$http({
			url: 'https://cnodejs.org/api/v1/topic/' + $routeParams.id,
			cache: true
		}).success(function (response) {
			//console.log(response.data);
			$scope.contents = response.data;
		});
		$scope.back=true;
	}
	init();
	$scope.toUser=function(name){
		$location.path('user/'+name);
	}
});
app.controller('UserController',function($scope,$http,$routeParams,$location){	
	function init(){
		var tab = new fz.Scroll('.ui-tab', {role: 'tab'});
		$http({
			url: 'https://cnodejs.org/api/v1/user/'+$routeParams.name,
			cache: true
		}).success(function (response) {
			//console.log(response.data);
			$scope.user = response.data;
		});
		$scope.back=true;
	}
	init();
	$scope.toTopic=function(id){
		$location.path('topic/'+id);
	}
});
app.controller('AboutController',function($scope,$http){
	$scope.back=true;
});
