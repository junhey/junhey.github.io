$(function(){
	var arr=location.href.split('.').pop().split('?');
	var courseNo=arr[1];
	var studentNo=localStorage['studentNo'];
	if (typeof(studentNo) == "undefined") {
		alert("请登录！");
		window.location.href="login.html";
	}
	var url=WebServiceURL+"course_cont?"+courseNo;
	console.log(url);	
	$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
			var courseDetailData= data["data"];
			for(var i=0;i<courseDetailData.length;i++)
				addCont(courseDetailData[i],i);
			}
		}
	});
	var addCont=function(courseDetail,index){
		var href="course.html?courseNo="+courseDetail["courseNo"]+"&selStatus=";
		var part1="<div data-courseNo=\""+courseDetail["courseNo"]+"\"; class=\"detail_name\">课程名："+courseDetail["courseName"]+"</div>";
		var part2="<div class=\"detail_detial\">";
		var part3="<div class=\"detail_img\"><img src=\""+ServiceURL+"attachments"+courseDetail["thumb"]+"\"/></div><div class=\"detail_cate\">课程分类："+courseDetail["courseCategory"]+"</div><div class=\"detail_cate\">选课人数：13人</div>";
		var part4="</div>";
		var part5="<div class=\"detail_cont\">"+courseDetail["courseContent"]+"</div>";
		var part6="<div class=\"btn_p p_fixed clear\">";
		//var part7="<div class=\"jion\"><a>加入</a></div><div class=\"order\"><a>预约</a></div><div class=\"store\"><a>收藏</a></div>";
		var part8="</div>";				
		context=part1+part2+part3+part4+part5+part6+part8;
		$('#courseCont').prepend(context);		
	};
	$("#evaluate").click(function(){
		var courseNo=$(".detail_name").attr("data-courseNo");
		var url=WebServiceURL+"evaluate_cont?courseNo="+courseNo;
		console.log(url);
		$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
			var courseEvaluateData= data["data"];
			for(var i=0;i<courseEvaluateData.length;i++)
				addEvaluate(courseEvaluateData[i],i);
			}
			if(4001==data['code']){
				$('#evaluate').text('暂无评价内容');
				return false;
			}
		}
		});	
	});
	
	var addEvaluate=function(courseEvaluate,index){		
		$('#evaluate').hide();
		var contextHead="<a class=\"list\" style=\"margin:0 0 44px;\">";
		var contextFoot="</a>";
		var part1="<div class=\"list_datial\"><div class=\"list_tit\">"+"课程评价:"+courseEvaluate["evaluateContent"]+"</div>";
		var part2="<div class=\"list_cont\">"+"课程回复："+courseEvaluate["eveluateReply"]+"</div></div>";
		context=contextHead+part1+part2+contextFoot;
		$('#courseCont').after(context);	
	};
	
	$(".jion").click(function(){
		var r=confirm("确认加入")
		if (r==true){
			var studentNo=localStorage['studentNo'];
			url=WebServiceURL+"insert_course?selStatus=1&"+"studentNo="+studentNo+"&"+courseNo;
			$.ajax({
			url:url,
			type:'POST',
			dataType:'jsonp',
			success:function(data){			
				if(2000==data['code']&&'success'==data['msg']){
					alert("加入成功");
					window.location.href="course.html";
				}else{
					alert("加入失败，请联系系统管理员");
				}
			}
			});
		}else{
			return false;
		}		
	});
	$(".order").click(function(){
	var r=confirm("确认加入")
	if (r==true){
		var studentNo=localStorage['studentNo'];
		url=WebServiceURL+"insert_course?selStatus=2&"+"studentNo="+studentNo+"&"+courseNo;
		$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
				alert("预约成功");
				window.location.href="course.html";
			}else{
				alert("预约失败，请联系系统管理员");
			}
		}
		});
		}else{
			return false;
		}
	});
	$(".store").click(function(){
		var r=confirm("确认加入")
		if (r==true){
		var studentNo=localStorage['studentNo'];
		url=WebServiceURL+"insert_course?selStatus=3&"+"studentNo="+studentNo+"&"+courseNo;
		$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
			alert("收藏成功");
			window.location.href="course.html";
			}else{
				alert("收藏失败，请联系系统管理员");
			}
		}
		});	
		}else{
			return false;
		}

	});
});