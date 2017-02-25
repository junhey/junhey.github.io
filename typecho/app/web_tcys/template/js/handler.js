//对分享时的数据处理
function _removeHTMLTag(str) {
	str = str.replace(/<script[^>]*?>[\s\S]*?<\/script>/g,'');
	str = str.replace(/<style[^>]*?>[\s\S]*?<\/style>/g,'');
    str = str.replace(/<\/?[^>]*>/g,'');
    str = str.replace(/\s+/g,'');
    str = str.replace(/&nbsp;/ig,'');
    return str;
}
/*menuHandler*/
var menuHandler=function (){
	var homeBtn=$("#homeBtn");
	var refreshBtn=$("#refreshBtn");
	var prevBtn=$("#prevBtn");
	var nextBtn=$("#nextBtn");
	if(homeBtn){
		homeBtn.on("click",function(){
			//window.location.href="mobile.php?act=channel&name=index&weid={$_W['account']['weid']}";
			window.location.href="index.html";
		});
		refreshBtn.on("click",function(){
			window.location.reload();
		});
		prevBtn.on("click",function(){
			window.history.back();
		});
		nextBtn.on("click",function(){
			window.history.forward();
		});
	}
};

var shareHandler=function(){
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		//禁止显示底部导航
		WeixinJSBridge.call('hideToolbar');
		//构建分享数据		
		/*
		<?php
			$_share = array();
			$_share['title'] = (empty($title)) ? $_W['account']['name'] : $title;
			$_share['link'] = 'http://'.$_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . '&wxref=mp.weixin.qq.com';
			$_share['img'] = $_W['siteroot'] . 'source/modules/' . $_GPC['name'] . '/icon.jpg';
		?>
		*/
		var _share_img = $('body img:eq(0)').attr("src");
		if(typeof(_share_img) == "undefined") _share_img = "{$_share['img']}";
		var _share_content = _removeHTMLTag($('body').html()).replace("{$_share['title']}",'');
		window.shareData = {
			"imgUrl": _share_img,
			"timeLineLink": "{$_share['link']}",
			"sendFriendLink": "{$_share['link']}",
			"weiboLink": "{$_share['link']}",
			"tTitle": "{$_share['title']}",
			"tContent":  _share_content,
			"fTitle": "{$_share['title']}",
			"fContent":  _share_content,
			"wContent":  "{$_share['title']}"
		};
	
		// 发送给好友
		WeixinJSBridge.on('menu:share:appmessage', function (argv) {
			WeixinJSBridge.invoke('sendAppMessage', {
				"img_url": window.shareData.imgUrl,
				"img_width": "640",
				"img_height": "640",
				"link": window.shareData.sendFriendLink,
				"desc": window.shareData.fContent,
				"title": window.shareData.fTitle
			}, function (res) {
				_report('send_msg', res.err_msg);
			})
		});
	
		// 分享到朋友圈
		WeixinJSBridge.on('menu:share:timeline', function (argv) {
			WeixinJSBridge.invoke('shareTimeline', {
				"img_url": window.shareData.imgUrl,
				"img_width": "640",
				"img_height": "640",
				"link": window.shareData.timeLineLink,
				"desc": window.shareData.tContent,
				"title": window.shareData.tTitle
			}, function (res) {
				_report('timeline', res.err_msg);
			});
		});
	
		// 分享到微博
		WeixinJSBridge.on('menu:share:weibo', function (argv) {
			WeixinJSBridge.invoke('shareWeibo', {
				"content": window.shareData.wContent,
				"url": window.shareData.weiboLink
			}, function (res) {
				_report('weibo', res.err_msg);
			});
		});
	}, false);
};

$(document).ready(function(e) {
	menuHandler();
	//shareHandler();
	var subpageWrapObj=document.getElementsByClassName("subpage-wrap").item(0);
	if(subpageWrapObj!==null){
		subpageWrapObj.ontouchmove=function(e){
			e.stopPropagation();
		};
	};
});