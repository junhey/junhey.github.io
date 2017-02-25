$(function($){	
 
	var studentNo=localStorage['studentNo'];
	if (typeof(studentNo) == "undefined") {
		alert("请登录！");
		window.location.href="login.html";
	}
	var url=WebServiceURL+"course?studentNo="+studentNo;
	console.log(url);	
	$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
			var selDate= data["data"];
			for(var i=0;i<selDate.length;i++)
				addCont(selDate[i],i);
			}
		}
	});
	var addCont=function(course,index){
		if(course["selStatus"]==1){
			var href="course_detail.html?courseNo="+course["courseNo"];
			var contextHead="<a class=\"list\" href=\""+href+"\">";
			var contextFoot="</a>";
			var part1="<div class=\"list_datial\"><div class=\"list_tit\">"+"选课课程号:"+course["courseNo"]+"</div>";
			var part2="<div class=\"list_cont\">"+"选课日期:"+course["selDate"]+"</div></div>";
			context=contextHead+part1+part2+contextFoot;
			$('#join').append(context);
		}
		if(course["selStatus"]==2){
			var href="course_detail.html?courseNo="+course["courseNo"];
			var contextHead="<a class=\"list\" href=\""+href+"\">";
			var contextFoot="</a>";
			var part1="<div class=\"list_datial\"><div class=\"list_tit\">"+"选课课程号:"+course["courseNo"]+"</div>";
			var part2="<div class=\"list_cont\">"+"选课日期:"+course["selDate"]+"</div></div>";
			context=contextHead+part1+part2+contextFoot;
			$('#order').append(context);
		}
		if(course["selStatus"]==3){
			var href="course_detail.html?courseNo="+course["courseNo"];
			var contextHead="<a class=\"list\" href=\""+href+"\">";
			var contextFoot="</a>";
			var part1="<div class=\"list_datial\"><div class=\"list_tit\">"+"选课课程号:"+course["courseNo"]+"</div>";
			var part2="<div class=\"list_cont\">"+"选课日期:"+course["selDate"]+"</div></div>";
			context=contextHead+part1+part2+contextFoot;
			$('#store').append(context);
		}	
	}	
});