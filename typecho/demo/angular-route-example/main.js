var app=angular.module('cnodejsapp',['ngRoute']);
function routeConfig($routeProvider){
	$routeProvider
	.when('/list',{controller:'ListController',templateUrl:'list.html'})
	.when('/content/:id',{controller:'ContentController',templateUrl:'content.html'})
	.when('/add',{controller:'AddController',templateUrl:'add.html'})
	.when('/edit/:id',{controller:'EditController',templateUrl:'edit.html'})
	.when('/about',{controller:'AboutController',templateUrl:'about.html'})
	.otherwise({redirectTo:'/'});
};
app.config(routeConfig);

var messageList=[{
		id : 1,
		title : 'title1',
		content : 'content1',
		date : new Date()
	},{
		id : 2,
		title : 'title2',
		content : 'content2',
		date : new Date()
	},{
		id : 3,
		title : 'title3',
		content : 'content3',
		date : new Date()
	}];
app.controller('ListController',function($scope){
	$scope.messageList=messageList;
});
app.controller('ContentController',function($scope,$routeParams){
	$scope.message=messageList[$routeParams.id-1];
});
app.controller('AddController',function($scope,$location){
	$scope.title="";
	$scope.content="";
	$scope.add=function(){
		messageList.push({
			id:messageList.length+1,
			title:$scope.title,
			content:$scope.content,
			date:new Date()
		});
		$location.path('list');
	}
	
});
app.controller('EditController',function($scope,$routeParams,$location){
	$scope.message=messageList[$routeParams.id-1];
	$scope.update=function(){
		messageList[$routeParams.id-1]=$scope.message;
		$location.path('list');
	}
});
app.controller('AboutController',function($scope,$location){
	$scope.about="该项目是基于Angular的route项目，实现单页面路由功能";
	$scope.index=function(){
		$location.path('list');
	}
});