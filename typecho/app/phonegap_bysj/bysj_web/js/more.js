$(function($){	
 
	var studentNo=localStorage['studentNo'];
	if (typeof(studentNo) == "undefined") {
		alert("请登录！");
		window.location.href="login.html";
	}
	var url=WebServiceURL+"student_cont?studentNo="+studentNo;
	$('.list-group').prepend('<li class="list-group-item lodaing"><label class="col-sm-2 control-label">个人资料加载中,请稍候...</label></li>');
	console.log(url);
		$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
			var studentDate= data["data"];
			for(var i=0;i<studentDate.length;i++)
				addCont(studentDate[i],i);
			}
		},
		complete:function(){
			$('.lodaing').hide();
		}
	});	

	var addCont=function(student,index){
		//console.log(student);
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">姓名</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<p class=\"form-control-static\">"+student["studentName"]+"</p>"
		var part4="</div>";
		var contextFoot="</li>";
		var context1=contextHead+part1+part2+part3+part4+contextFoot;
		
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">学号</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<p class=\"form-control-static\">"+student["studentNo"]+"</p>"
		var part4="</div>";
		var contextFoot="</li>";
		var context2=contextHead+part1+part2+part3+part4+contextFoot;
		
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">身份证号</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<p class=\"form-control-static\">"+student["idCard"]+"</p>"
		var part4="</div>";
		var contextFoot="</li>";
		var context3=contextHead+part1+part2+part3+part4+contextFoot;
		
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">地址</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<p class=\"form-control-static\">"+student["address"]+"</p>"
		var part4="</div>";
		var contextFoot="</li>";
		var context4=contextHead+part1+part2+part3+part4+contextFoot;
		$('.list-group').prepend(context4);
		$('.list-group').prepend(context3);
		$('.list-group').prepend(context2);
		$('.list-group').prepend(context1);
	}
	
	
	$("#modify").click(function(){
		//alert("更新成功");
		window.location.href="student_alert.html";
	});
	
	
	
	$("#logout").click(function(){
		localStorage.removeItem("studentNo");
		localStorage.clear();
		alert("注销成功");
		window.location.href="home.html";
	});

	
});