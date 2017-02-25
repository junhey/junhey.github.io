$(function(){
 
	//var arr=location.href.split('.').pop().split('?');
	var studentNo=localStorage['studentNo'];
	var url=WebServiceURL+"student_cont?studentNo="+studentNo;
	//console.log(url);
	$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
			var studentData= data["data"];
			for(var i=0;i<studentData.length;i++)
				addCont(studentData[i],i);
			}
		}
	});
	var addCont=function(student,index){
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">姓名</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<input class=\"form-control-static studentName\" value="+student["studentName"]+"></input>";
		var part4="</div>";
		var contextFoot="</li>";
		var context1=contextHead+part1+part2+part3+part4+contextFoot;
		
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">学号</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<p class=\"form-control-static studentNo\">"+student["studentNo"]+"</p>"
		var part4="</div>";
		var contextFoot="</li>";
		var context2=contextHead+part1+part2+part3+part4+contextFoot;
		
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">身份证号</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<input class=\"form-control-static idCard\" value="+student["idCard"]+"></input>";
		var part4="</div>";
		var contextFoot="</li>";
		var context3=contextHead+part1+part2+part3+part4+contextFoot;
		
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">地址</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<input class=\"form-control-static address\" value="+student["address"]+"></input>";
		var part4="</div>";
		var contextFoot="</li>";
		var context4=contextHead+part1+part2+part3+part4+contextFoot;
		
		var contextHead="<li class=\"list-group-item\">";
		var part1="<label class=\"col-sm-2 control-label\">密码</label>";
		var part2="<div class=\"col-sm-10\">";
		var part3="<input class=\"form-control-static password\" value="+student["password"]+"></input>";
		var part4="</div>";
		var contextFoot="</li>";
		var context5=contextHead+part1+part2+part3+part4+contextFoot;
		$('#student_message').prepend(context5);
		$('#student_message').prepend(context4);
		$('#student_message').prepend(context3);
		$('#student_message').prepend(context2);
		$('#student_message').prepend(context1);
	}

	
	
	$("#student_message").on("click","#alter",function(){
		var studentName=encodeURI($(".studentName").val());
		var studentNo=localStorage['studentNo'];
		var idCard=$(".idCard").val();
		var address=encodeURI($(".address").val());
		var password=$(".password").val();
		var url=WebServiceURL+"alter_student?studentNo="+studentNo+"&studentName="+studentName+"&idCard="+idCard+"&address="+address+"&password="+password;
		console.log(url);
		$.ajax({
			url:url,
			type:'POST',
			dataType:'jsonp',
			success:function(data){			
				if(2000==data['code']&&'success'==data['msg']){
				alert("修改成功");
				window.location.href="more.html";
			}
			}
		});			
	});	
});
	