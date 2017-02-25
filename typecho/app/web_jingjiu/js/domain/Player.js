function Player(playerBitMap){
	base(this,LSprite,[]);
	var self = this;
	self.mode = "";
	var bitmap = playerBitMap;
	var width = bitmap.bitmapData.width;
	var height = bitmap.bitmapData.height;
	var scale =game_width / 5 / width;
	bitmap.scaleX  = scale;
	bitmap.scaleY = scale;
	this.actualWidth = width * scale;
	this.actualHeight = height * scale;
	self.addChild(bitmap);
}

Player.prototype.run=function(){
	var self=this;
	if(self.mode == "left"){
		if(self.x > 10)self.x -= 10;
	}else if(self.mode == "right"){
		if(self.x < LGlobal.width - self.getWidth())self.x += 10;
	}	
}