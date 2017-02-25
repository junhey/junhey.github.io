$(function(){
 
	//var arr=location.href.split('.').pop().split('?');
	var studentNo=localStorage['studentNo'];
	if (typeof(studentNo) == "undefined") {
		alert("请登录！");
		window.location.href="login.html";
	}
	var url=WebServiceURL+"message_cont?studentNo="+studentNo;
	//console.log(url);
	$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
			var messageData= data["data"];
			for(var i=0;i<messageData.length;i++)
				addCont(messageData[i],i);
			}
		}
	});
	var addCont=function(message,index){
		var contextHead="<a class=\"list\">";
		var contextFoot="</a>";
		var part1="<div class=\"list_datial\"><div class=\"list_tit\">"+message["sendContent"]+"</div>";
		var part2="<div class=\"list_cont\">"+message["sendDate"]+"</div></div>";
		context=contextHead+part1+part2+contextFoot;
		$('#message_list').append(context);
		}
	});