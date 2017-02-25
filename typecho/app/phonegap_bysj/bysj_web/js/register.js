$(function($){
	var studentNo=localStorage['studentNo'];
	if (typeof(studentNo) != "undefined") {
		alert('您已登录！')
		window.location.href="more.html";
	}
	$('.submit').on('click',function(){
	var studentNo=$('.studentNo').val();
	var password=$('.password').val();
	var password2=$('.password2').val();	
	var url=WebServiceURL+"register"+"?studentNo="+studentNo+"&password="+password;	
	if(studentNo==""){
		alert("学号不能为空!");
		window.location.reload();
	}else{
		if(password==""&&password2==""){
			alert("密码不能为空!");
			window.location.reload();
		}
		if(password!=password2){
			alert("两次密码输入不一致!");
			window.location.reload();
		}
		$.ajax({
			url:url,
			type:'POST',
			dataType:'jsonp',
			success:function(data){			
				if(2000==data['code']&&'success'==data['msg']){
					localStorage.setItem("studentNo",studentNo);
					alert("注册成功");
					window.location.href="home.html"; 
				}
				if(4001==data['code']&&'fail'==data['msg']){
					alert("注册失败");
					window.location.reload();
					
				}
			}
		});
	}	
});
});