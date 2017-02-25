function GraphicHandler(canvasObj,canvasWrapObj){
	
	cG=new GraphicObj(canvasObj,canvasWrapObj);
	
	this.circleClear =function (){
		cG.removerAllGraphics();
	};
	
	this.setOnMouseEvent=function(_event){
		cG.setOnMouseEvent(_event);
	}
	
	this.saveImg =function (){
		cG.saveImg();
	};
	
	var imgUrl;
	this.setImg=function(_imgUrl){
		imgUrl=_imgUrl;
	};
	
	this.circleDisplay =function (_data){
		if(typeof(_data)=="undefined"){
			_data={
				mx:null,my:null,mr:null,mn:null,ms:null,md:null,
			}
		}
		var x=(typeof(_data.mx)=="undefined" || _data.mx==null)?parseInt($("#x").val()):_data.mx;
		var y=(typeof(_data.my)=="undefined" || _data.my==null)?parseInt($("#y").val()):_data.my;
		var r=(typeof(_data.mr)=="undefined" || _data.mr==null)?parseInt($("#r").val()):_data.mr;
		var num=(typeof(_data.mn)=="undefined" || _data.mn==null)?parseInt($("#btnNum").val()):_data.mn;
		var scale=(typeof(_data.ms)=="undefined" || _data.ms==null)?parseFloat($("#btnScale").val()):_data.ms;
		var sDeg=(typeof(_data.md)=="undefined" || _data.md==null)?parseFloat($("#btnDegree").val()):_data.md;
		var data={
			x:x,y:y,r:r,num:num,
			imgUrl:imgUrl,
			scale:scale,
			sDeg:sDeg
		};
		this.circleClear();
		//显示图像
		cG.circleHandler(data);
	};
}