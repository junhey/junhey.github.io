	systemInit();
	var game_width = client_width;
	var game_height =client_height;
	
	var imgData = imgArr;

	init(50,"legend",game_width,game_height,main);

	function main(){
		LLoadManage.load(imgData,null,gameInit);
	}
	
	var rootLayer,playerLayer,drugLayer,pointLayer,continueLayer,continueErexplain;
	var imglist;
	var player;
	var point=0;
	var drugCount = 0,drugMax=5;
	function gameInit(result){
		 imglist = result;
		 gameBgInit();		 
		 playerInit();
		 drugInit();
		 pointLayerInit();
		 addEvent();
	}
	function pointLayerInit(){
		pointLayer= new LTextField();
		pointLayer.color = "#0000ff";
		pointLayer.size = 13;
		pointLayer.x = 110;
		pointLayer.y = game_height-40;
		pointLayer.text = point;
		rootLayer.addChild(pointLayer);
		
		continueLayer= new LTextField();
		continueLayer.color = "#ff0000";
		continueLayer.size = 13;
		continueLayer.x = 190;
		continueLayer.y = game_height-20;
		continueLayer.text = 30000;
		rootLayer.addChild(continueLayer);
		
		pointLayErexplain = new LTextField();
		pointLayErexplain.color = "#000";
		pointLayErexplain.size = 13;
		pointLayErexplain.x = 20;
		pointLayErexplain.y = game_height-40;
		pointLayErexplain.text = "当前积分:";
		rootLayer.addChild(pointLayErexplain);
		
		continueErexplain = new LTextField();
		continueErexplain.color = "#000";
		continueErexplain.size = 13;
		continueErexplain.x = 20;
		continueErexplain.y = game_height-20;
		continueErexplain.text = "距离晋级还需要积分:";
		rootLayer.addChild(continueErexplain);
	}
	
	function drugInit(){
		drugLayer= new LSprite();
		rootLayer.addChild(drugLayer);
	}
	
	function refreshPoint(){
		pointLayer.text = point;
		continueLayer.text = 30000 - point;
	}
	
	
	function addEvent(){
		rootLayer.addEventListener(LEvent.ENTER_FRAME,onframe);
		rootLayer.addEventListener(LMouseEvent.MOUSE_DOWN,onDown);
		rootLayer.addEventListener(LMouseEvent.MOUSE_UP,onUp);
	}
	
	function onframe(){
		player.run();
		for(var key in drugLayer.childList){
			drugLayer.childList[key].run();
			if(drugLayer.childList[key].mode=="die"){
				drugLayer.removeChild(drugLayer.childList[key]);
				drugCount-=1;
			}
		}
		if(drugCount++ > drugMax){
			drugCount = 0;
			if(Math.random()*10<3){
				addDrug();
			}
		}if(point>=30000){
			gameOver();
		}
	}
	
	function onDown(event){
		var x = player.x;
		var exentX = event.selfX;
		if(exentX<x){
			player.mode = "left";
		}else{
			player.mode = "right";
		}
	}
	
	function onUp(){
		player.mode = "";
	}
	
	function addDrug(){
		var x = 20 + Math.floor(Math.random()*(LGlobal.width - 100));
		var drug=new Drug(player,x,imglist,7,"medicine",point,function(resultPoint){
			point = resultPoint;
			refreshPoint();
		});
		drugLayer.addChild(drug);
	}
	
	function gameBgInit(){
		 rootLayer = new LSprite();
		 addChild(rootLayer);
		 var bitmap=new LBitmap(new LBitmapData(imglist["back"]));
		 rootLayer.addChild(bitmap);
	}
	
	function playerInit(){
		 playerLayer = new LSprite();
		 rootLayer.addChild(playerLayer);
		 var platBitmap = new LBitmap(new LBitmapData(imglist["player"]));
		 player = new Player(platBitmap);
		 player.x = (game_width- player.actualWidth)/2;
		 player.y = game_height-player.actualHeight-20;		
		 playerLayer.addChild(player);	 
	}
	
	function gameOver(){
		rootLayer.die();
		LGlobal.preventDefault = false;
		$(LGlobal.canvasObj).remove();
		$("#legend").remove();
		$(".popup").show();
	}

