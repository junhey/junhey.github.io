$(function($){
	function getUrl(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	    var r = window.location.search.substr(1).match(reg);
	    if (r != null) return unescape(r[2]); return null;
	};
	var categoryId=getUrl('courseCategory');
	var url=WebServiceURL+"course_list?courseCategory="+categoryId;
	//console.log(url);	
	$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){
			if(2000==data['code']&&'success'==data['msg']){
			var courseData= data["data"];
			//console.log(courseData);
			for(var i=0;i<courseData.length;i++)
				addList(courseData[i],i);				
			}
			var btn="<a class=\"list btn-primary btn-more\">点击加载更多</a>";
			$('#courseList').append(btn);
		}
	});
	var addList=function(course,index){
		var href="course_detail.html?courseNo="+course["courseNo"];
		var contextHead="<a class=\"list\" href=\""+href+"\">";
		var contextFoot="</a>";
		var part1="<div class=\"list_img\"><img src=\""+ServiceURL+"attachments"+course["thumb"]+"\"></div>";
		var part2="<div class=\"list_datial\"><div class=\"list_tit\">"+course["courseName"]+"</div>";
		var part3="<div class=\"list_cont\">"+course["courseContent"].substr(0, 60)+"</div></div>";
		context=contextHead+part1+part2+part3+contextFoot;
		$('#courseList').append(context);
	};
	$('#courseList').on("click",".btn-more", function(){
		$(".btn-more").text('加载中...');
		addNextpage();
	});
	var addNextpage=function(){
		var categoryId=getUrl('courseCategory');
		if(typeof(sessionStorage['page'])== "undefined"){
			sessionStorage.removeItem("page");
			sessionStorage.setItem("page", "2");
		}else{
			var page_add=parseInt(sessionStorage.getItem("page"))+1;
			sessionStorage.setItem("page", page_add);
		}
		
		var page=sessionStorage.getItem("page");
		var url=WebServiceURL+"course_list?courseCategory="+categoryId+"&page="+page;
		console.log(url);	
		$.ajax({
			url:url,
			type:'POST',
			dataType:'jsonp',
			success:function(data){
				if(2000==data['code']&&'success'==data['msg']){
				var courseData= data["data"];
				console.log(courseData);
				for(var i=0;i<courseData.length;i++)
					addList(courseData[i],i);				
				}
				$(".btn-more").hide();
				if(4001==data['code']){
					var btn="<a class=\"list btn-primary btn-mored\">已经全部加载完了...</a>";
					sessionStorage.removeItem("page");
				}else{
					btn="<a class=\"list btn-primary btn-more\">点击加载更多</a>";
				}				
				$('#courseList').append(btn);
			},
			complete:function(){
				
			}
		});
	}
});