function ResourceHandler(){
	var resource=new Resource();
	resource.setUrl("http://nieyu.com/html5/canvas/file.php");
	resource.setRoot("resource/");
	$("#dirArea").html('<div style="color:red;text-align:center"><br />数据载入中，请稍候……<br /></div>');
	var that=this;
	this.resourceInit=function(path){
		tpl={
			dirTpl:'<li class="dirLi c-ulLiInit c-bgrptn text-center" data-path="$$PATH$$" data-ctype="dir"><span class="dirName">$$NAME$$</span></li>',
			fileTpl:'<li class="fileLi c-ulLiInit c-bgrptn text-center" data-path="$$PATH$$" data-ctype="file"><span class="fileView"><img src="$$PATH$$"></span><span class="fileName">$$NAME$$</span></li>'
		};				
		regx={
			url:/\$\$PATH\$\$/g,workName:/\$\$NAME\$\$/g
		};
		
		resource.setPath(path);
		resource.setDataLoadCompletedHandler(resourceLoaded);
		resource.loadResource();
	};
	
	var codeAddToPageEventHandler;
	this.setCodeAddToPageEventHandler=function(_codeAddToPageEventHandler){
		codeAddToPageEventHandler=_codeAddToPageEventHandler;
	};
	
	function resourceLoaded(d,t,xhr){
		resourceData=resource.getDataList(d);
		code=resource.getCode(regx,tpl,resourceData);
		resourceCodeAddToPage(code);
	};
		
	function resourceCodeAddToPage(code){
		$("#dirArea").html(code.dirCode);
		$("#fileArea").html(code.fileCode);
		codeAddToPageEventHandler();
	};
};