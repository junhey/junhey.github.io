$(function($){
 
	//var arr=location.href.split('.').pop().split('?');	
	
	$(".submit").click(function(){
		var keyword=encodeURI($(".keyword").val());
		var url=WebServiceURL+"search_course?keyword="+keyword;
		console.log(url);	
		$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){
			if(2000==data['code']&&'success'==data['msg']){
			var courseData= data["data"];
			for(var i=0;i<courseData.length;i++)
				addList(courseData[i],i);
			}
			if(4001==data['code']&&'data empty'==data['msg']){
				alert("没有查询结果");
				window.location.href="search.html";
			}
		}
	});
		$(".container").hide();
	});
	
	var addList=function(course,index){
		var href="course_detail.html?courseNo="+course["courseNo"];
		var contextHead="<a class=\"list\" href=\""+href+"\">";
		var contextFoot="</a>";
		var part1="<div class=\"list_img\"><img src=\""+ServiceURL+"attachments"+course["thumb"]+"\"></div>";
		var part2="<div class=\"list_datial\"><div class=\"list_tit\">"+course["courseName"]+"</div>";
		var part3="<div class=\"list_cont\">"+course["courseContent"]+"</div></div>";
		context=contextHead+part1+part2+part3+contextFoot;
		$('.c_cont_login').append(context);
	}
});