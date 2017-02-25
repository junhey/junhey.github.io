$(document).ready(function(event) {
	
	//* 点击“开始”按钮
	$("#gotoInput").click(function(e) {
		$.mobile.changePage("#input");
	});
	
	//* 点击“再玩一次”按钮
	$("#gotoIntro").click(function(e) {
		$("#txtInfo").html("请输入名字");
		$("#shakeAnim").addClass("hideMe");
		$("#my_image").attr("src","images/space.gif");
		$.mobile.changePage("#intro");
	});
	
	
	//-------<文本输入页方法>-------//
	var inputInfo = new String;		//* 输入的信息
	
	//*点击"文本输入框"显示系统文本输入框
	$("#btnInput").click(function(event){
		inputMsg();
	});
	
	
	//* 显示系统文本输入框
	function inputMsg(){
		var user = window.prompt("请输入名字","");
		var user = user.replace(/^\s*|\s*\$/gi,'');
		if(user == ""){
			alert("请输入名字");
			inputMsg();
		}else{
			$("#txtInfo").html(user);
		}
	}
	//-------</文本输入页方法>-------//
	
	
	//-------<摇晃监测页方法>-------//
	//* 监听 PhoneGap 是否载入完成
	document.addEventListener("deviceready", onDeviceReady, false);
	
	var resultId=0;		//* 随机结果
	
	function onDeviceReady() {
		//* 点击“准备好了”按钮
		$("#gotoShake").click(function(e) {
			inputInfo = $("#txtInfo").html();	//* 读取 txtInfo 的内容
			
			//* 如果用户没有输入内容，则显示输入框
			if(inputInfo == "请输入名字"){
				inputMsg();
				return;	
			}else{ //* 如果用户已输入内容，则进入摇晃监测页并启动摇晃测试
				$.mobile.changePage("#shake");
				startWatch();
			}
		});
		
		
		var options = { frequency: 300 };	//* 监听周期
		var watchID = null;					//* watchID 将作为 watchAcceleration 方法的返回值
		var previousReading = { x: null, y: null, z: null}	//* 保存前一次读取到的加速度数据值
		var bound = 5;						//* 阈值
		
		//* 开启周期性监听加速度				
		function startWatch() {
			previousReading = {x: null, y: null, z: null};
			watchID = navigator.accelerometer.watchAcceleration(onSuccess, onError, options);
		}
		
		//* 停止周期性监听加速度
		function stopWatch() {
			if (watchID) {
				navigator.accelerometer.clearWatch(watchID);
				watchID = null;
			}
			previousReading = {x: null, y: null, z: null};
		}
		
		//* 成功获取加速度
		function onSuccess(reading) {
			var changes = {};	//* 记录当前加速度变化值
			if(previousReading.x !== null){		
				changes.x = Math.abs(previousReading.x - reading.x);
				changes.y = Math.abs(previousReading.y - reading.y);
				changes.z = Math.abs(previousReading.z - reading.z);		
			}
			
			//* 判断是否满足摇晃操作的条件			
			if(changes.x>bound && changes.y>bound && changes.z>bound){
				stopWatch();
				$("#shakeAnim").removeClass("hideMe");
				$("#my_image").attr("src","images/shake_anim_all.gif");
				navigator.notification.vibrate(1000);
				var t = setTimeout(shakeHandler,2500);
			}
			
			//* 将当前加速度值保存到上一次加速度值对象
			previousReading = { x: reading.x, y: reading.y, z: reading.z}
		}
		
		//* 获取加速度失败 
		function onError() {
			 alert('onError!');
		}
		
		//* 摇晃最终完成的处理
		function shakeHandler() {
			var shakeResultId = parseInt(Math.random()*2);
			if(shakeResultId == 0){
				$("#reusltImg").attr("src","images/result_0.png");
			}else if(shakeResultId == 1){
				$("#reusltImg").attr("src","images/result_1.png");
			}
			resultId = shakeResultId;
			$.mobile.changePage("#result");
		}
		
	}
	
	//-------</摇晃监测页方法>-------//
	
	
	//-------<结果页方法>-------//
	$("#btnWeibo").click(function(event){
		var defaultContent = new String;		
		var strResult = new String;	
		
		if(resultId==0){
			strResult = "忧郁的骷髅人"
		}else if(resultId == 1){
			strResult = "傲娇的死神"
		}
		defaultContent = "万圣节来了，" + inputInfo + "将在万圣节变身为" + strResult + "。你也赶快来测试下你的万圣节的造型吧！";
		postToWb(defaultContent);
	});
	
	//* 腾讯微博
	function postToWb($msg){
		var _t = encodeURI($msg);
		var _url = encodeURIComponent("");	//* 显示信息来源的URL
		var _appkey = "";		//从腾讯获得的appkey这个可以不填，如果有自己的appkey则可以显示自己的来源显示
		var _pic = encodeURI('');//
		var _site = '';			//你的网站地址，可以留空
		var _u = 'http://v.t.qq.com/share/share.php?url='+_url+'&appkey='+_appkey+'&site='+_site+'&pic='+_pic+'&title='+_t;
		window.open( _u,'', 'width=480, height=800, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no' );
	}
	//-------</结果页方法>-------//
	
	//* 响应物理后退按钮
	document.addEventListener("backbutton", eventBackButton, false);
		
	function eventBackButton(){
		navigator.notification.confirm("是否退出万圣节更衣室", onConfirm, "退出程序", "确认,取消");
	}
		
	function onConfirm(button) {
		if(button == 1){
			navigator.app.exitApp();
		}
	}
	 
});
