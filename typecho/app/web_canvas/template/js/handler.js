$(document).ready(function(e) {
	var canvasObj,canvasWrapObj,imgUrl,ctlBtnFlag=true;
	var deltaSY=0.8,deltaDY=0,deltaNY=4,deltaRY=150,delta;
	var graphicHandler,resourceHandler,eventCollection;
	
	pageInit();
	function pageInit(){
		eventCollection={
			mouseDown:function(e){/*console.log("mouseDown");*/},
			mouseUp  :function(e){/*console.log("mouseUp");*/},
			mouseDrag:canvasOnMouseDragHandler,
			mouseMove:function(e){/*console.log("mouseMove");*/}
		};
		
		canvasObj=document.getElementById('canvas');
		canvasWrapObj=$("#canvasWrap");
		imgUrl="template/images/logo.png";
		path="resource/";
		graphicHandler=new GraphicHandler(canvasObj,canvasWrapObj);
		graphicHandler.setImg(imgUrl);
		graphicHandler.setOnMouseEvent(eventCollection);
		//resourceHandler=new ResourceHandler();
		//resourceHandler.resourceInit(path);
		//resourceHandler.setCodeAddToPageEventHandler(codeAddToPageEventHandler);
	};
	
	function canvasOnMouseDragHandler(e){
		var x=e.event.offsetX;
		var y=e.event.offsetY;
		graphicHandler.circleDisplay({mx:x,my:y});
		$("#x").val(x);
		$("#y").val(y);
		$("#ctlCreateCircle").fadeIn("fast");
		$("#btnCreatCircle").text("关闭圆形图案创建面板");
		ctlBtnFlag=false;
		rangeMsgShow();
	};
	
	
	$("#canvas").on("mousewheel",canvasOnMouseWheel);
	
	function canvasOnMouseWheel(){
		
		var maxS=parseFloat($("#btnScale").attr("max"));
		var minS=parseFloat($("#btnScale").attr("min"));
		var dtS=parseFloat($("#btnScale").attr("step"));
		var maxD=parseFloat($("#btnDegree").attr("max"));
		var minD=parseFloat($("#btnDegree").attr("min"));
		var dtD=parseFloat($("#btnDegree").attr("step"));
		var maxN=parseFloat($("#btnNum").attr("max"));
		var minN=parseFloat($("#btnNum").attr("min"));
		var dtN=parseFloat($("#btnNum").attr("step"));
		var maxR=parseFloat($("#r").attr("max"));
		var minR=parseFloat($("#r").attr("min"));
		var dtR=parseFloat($("#r").attr("step"));
		
		var wheelVal="";
		wheelVal=parseInt($('input[name="wheelCtrl"]:checked').val());
		switch(wheelVal){
			case 0:
				deltaSY=getDeltaY(event.deltaY,deltaSY,dtS,maxS,minS);
				$("#btnScale").val(deltaSY);
				graphicHandler.circleDisplay({ms:deltaSY});
			break;
			case 1:
				delta=1;
				deltaDY=getDeltaY(event.deltaY,deltaDY,dtD,maxD,minD);
				$("#btnDegree").val(deltaDY);
				graphicHandler.circleDisplay({md:deltaDY});
			break;
			case 2:
				deltaNY=getDeltaY(event.deltaY,deltaNY,dtN,maxN,minN);
				$("#btnNum").val(deltaNY);
				graphicHandler.circleDisplay({mn:deltaNY});
			break;
			case 3:
				deltaRY=getDeltaY(event.deltaY,deltaRY,dtR,maxR,minR);
				$("#r").val(deltaRY);
				graphicHandler.circleDisplay({mr:deltaRY});
			break;
		}
		
		$("#ctlCreateCircle").fadeIn("fast");
		$("#btnCreatCircle").text("关闭圆形图案创建面板");
		ctlBtnFlag=false;
		rangeMsgShow();
		
		event.preventDefault();
		
		function getDeltaY(edy,dy,d,mav,miv){
			if(edy<0){
				dy+=d;
				if(dy>=mav){
					dy=mav;
				}
			}
			else{
				dy-=d;
				if(dy<=miv){
					dy=miv;
				}
			}
			return dy;
		};
	};
	
	function codeAddToPageEventHandler(code){
		$(".fileLi,.dirLi").each(function(index, element) {
			$(this).on('click',function(){
				$("#ctlCreateCircle").fadeIn("fast");
				$("#btnCreatCircle").text("关闭圆形图案创建面板");
				ctlBtnFlag=false;
				var url=$(this).attr("data-path");
				var type=$(this).attr("data-ctype");
				if(type=="dir"){
					resourceHandler.resourceInit(url)
				}
				if(type=="file"){
					graphicHandler.setImg(url);
					graphicHandler.circleDisplay();
				}
			});
		});
	};
	
	//各种事件绑定处理
	$("#btnCreatCircle").on("click",function(){
		if(ctlBtnFlag){
			$("#ctlCreateCircle").fadeIn("fast");
			$(this).text("关闭圆形图案创建面板");
		}
		else{
			$("#ctlCreateCircle").fadeOut("fast");
			$(this).text("打开圆形图案创建面板");
			graphicHandler.circleClear();
		}
		ctlBtnFlag=!ctlBtnFlag;
	});
	
	function rangeMsgShow(){
		$("#showScale").text($("#btnScale").val());
		$("#showNum").text($("#btnNum").val());
		$("#showDegree").text($("#btnDegree").val());
		$("#showX").text($("#x").val());
		$("#showY").text($("#y").val());
		$("#showR").text($("#r").val());
	};
	
	$("#btnScale,#btnNum,#btnDegree,#x,#y,#r").on("change",function(){
		rangeMsgShow();
		graphicHandler.circleDisplay();
	});
	
	$("#btnCreatCircleAction").on("click",function(){
		graphicHandler.circleDisplay();
	});
	
	$("#btnClearCircleAction").on("click",function(){
		graphicHandler.circleClear();
	});
	
	$("#btnSaveCircleAction").on("click",function(){
		graphicHandler.saveImg();
	});
	
});