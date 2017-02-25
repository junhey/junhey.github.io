var index;
function Drug(palyer,x,imgArr,size,key,point,pointCallBack){
	base(this,LSprite,[]);
	var self = this;
	self.mode="";
	index = Math.floor(Math.random()*size);
	var bitmap = new LBitmap(new LBitmapData(imgArr[key+index]));
	self.x=x;
	self.addChild(bitmap);
	this.pointCallBack = pointCallBack;
}
Drug.prototype.run=function(){
	var self=this;
	self.y += 5;
	var hit = self.checkHit();
	if(hit || self.y > LGlobal.height){
		self.mode="die";
	}
}
Drug.prototype.checkHit=function(){
	var self=this;
	if(LGlobal.hitTestArc(self,player)){
		point += 1000*(index+1);
		this.pointCallBack(point);
		return true;
	}
	return false;
}