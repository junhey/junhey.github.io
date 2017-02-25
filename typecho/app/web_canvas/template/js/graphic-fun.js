function GraphicObj(canvasObj,canvasWrapObj){
	//js单例模式
	if( GraphicObj.unique !== undefined ){
        return GraphicObj.unique; 
    };
	
	var ctx;
	ctx=canvasObj.getContext("2d");
	canvasObj.width=canvasWrapObj.width();
	
	var ObjList=[];
	var group;
	paper.install(window);
	paper.setup(canvasObj);
	var tool = new Tool();
	
	this.setOnMouseEvent=function(_onMouseEvent){
		var mouseEvent   = _onMouseEvent
		tool.onMouseDown = mouseEvent.mouseDown;
		tool.onMouseUp   = mouseEvent.mouseUp;
		tool.onMouseDrag = mouseEvent.mouseDrag;
		tool.onMouseMove = mouseEvent.mouseMove;
	};
		
	//获取图元轨迹
	function getLocusByCircle(_data){
		var a=_data.x;
		var b=_data.y;
		var r=_data.r;
		var num=_data.num;
		var sDeg=_data.sDeg;
		var pointsList=[];
		var maxDeg=360;
		var rr=2 * Math.PI / maxDeg;
		var s=Math.ceil(maxDeg / num);
		for(var i=0;i<maxDeg;i++){
			if(i % s==0){
				var x=a+(r*Math.cos((i+sDeg) * rr));
				var y=b+(r*Math.sin((i+sDeg) * rr));
				pointsList.push({"x":x,"y":y});
			};
		};
		return pointsList;
	};
	
	//构建图元
	function circleCreat(_data){
		var pointsPzt=_data.pointsPzt;
		var imgUrl=_data.imgUrl;
		var scale=_data.scale;
		var x=_data.x;
		var y=_data.y;
		
		for(var i=0;i<pointsPzt.length;i++){
			var raster = new Raster({
				source:imgUrl,
				position:[pointsPzt[i].x, pointsPzt[i].y]
			});
			raster.scale(scale);
			ObjList.push(raster);
		};
		var group = new Group(ObjList);
		group.position = [x,y];
	};
	
	//数据加载和图元生成
	this.circleHandler=function(_data){
		var x=_data.x;
		var y=_data.y;
		var r=_data.r;
		var num=_data.num;
		var imgUrl=_data.imgUrl;
		var scale=_data.scale;
		var sDeg=_data.sDeg;
		//var rotate=data.rotate;
		if(x.length!=0&&!isNaN(x)&&y.length!=0&&!isNaN(y)&&r.length!=0&&!isNaN(r)&&num.length!=0&&!isNaN(num)){
			//获取所需的坐标点
			var dataPoints={
				x:x,
				y:y,
				r:r,
				num:num,
				sDeg:sDeg
			}
			var pointsPzt=getLocusByCircle(dataPoints);	
			//开始绘图
			var dataCircle={
				pointsPzt:pointsPzt,
				imgUrl:imgUrl,
				scale:scale,
				x:x,
				y:y
			}
			circleCreat(dataCircle);
		};
	};
	
	this.saveImg=function(){
		//var imgData=ctx.getImageData(0,0,canvasObj.width,canvasWrapObj.height());
		var imgUrl=canvasObj.toDataURL();
		window.open(imgUrl);
		//console.log(imgUrl);
	};
	
	//测试获取所有图元对象
	this.getObjList=function(){
		for(var i=0;i<ObjList.length;i++){
			//console.log(ObjList[i]);
		};
	};
	
	//移除图元对象和清空画布
	this.removerAllGraphics=function(){
		ctx.clearRect(0,0,canvasObj.width,canvasWrapObj.height());
		for(var i=0;i<ObjList.length;i++){
			ObjList[i].remove();
		};
		ObjList.length=0;
	};
};