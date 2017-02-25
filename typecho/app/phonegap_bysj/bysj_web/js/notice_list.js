$(function($){
 
	var url=WebServiceURL+"notice_cont";
	var studentNo=localStorage['studentNo'];
	//console.log(url);
	$.ajax({
		url:url,
		type:'POST',
		dataType:'jsonp',
		success:function(data){
			if(2000==data['code']&&'success'==data['msg']){
			var noticeData= data["data"];
			for(var i=0;i<noticeData.length;i++)
				addList(noticeData[i],i);
			}else{
				document.write("无内容！");
			}
		}
	});
	var addList=function(notice,index){
		console.log(notice);
		var href="notice_detail.html?noticeNo="+notice["noticeNo"];
		var contextHead="<a class=\"list\" href=\""+href+"\">";
		var contextFoot="</a>";
		var part1="<div class=\"list_img\"><img src=\""+ServiceURL+"attachments"+notice["thumb"]+"\"></div>";
		var part2="<div class=\"list_datial\"><div class=\"list_tit\">"+notice["noticeTitle"]+"</div>";
		var part3="<div class=\"list_cont\">"+notice["noticeContent"]+"</div></div>";
		context=contextHead+part1+part2+part3+contextFoot;
		$('#notice_list').append(context);
	}
			/*
				<a class="list">
					<div class="list_img"><img src="images/123.jpg"/></div>
					<div class="list_detial">
						<div class="list_tit">小米：饥饿营销已走到尽头</div>
						<div class="list_cont">最近一段时间，小米遭遇些烦心事，事情并不算大，但却直戳痛点。事情源于一篇黄牛的自述文章引发了众...</div>
					</div>
				</a>
			*/
});