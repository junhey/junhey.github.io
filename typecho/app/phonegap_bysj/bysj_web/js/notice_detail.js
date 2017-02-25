$(function(){
 
	var arr=location.href.split('.').pop().split('?');
	var url=WebServiceURL+"notice_cont?"+arr[1];
	console.log(url);	
	$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){			
			if(2000==data['code']&&'success'==data['msg']){
			var noticeDetailData= data["data"];
			for(var i=0;i<noticeDetailData.length;i++)
				addCont(noticeDetailData[i],i);
			}
		}
	});
	var addCont=function(noticeDetail,index){
		var part1="<div class=\"news_tit\">"+noticeDetail["noticeTitle"]+"</div>";
		var part2="<div class=\"news_msg\">"+"发布时间："+noticeDetail["noticeTime"]+"</div>";
		var part3="<div class=\"news_cont\">"+noticeDetail["noticeContent"]+"</div>";
		context=part1+part2+part3;
		$('#notice_detail').append(context);
	}
});