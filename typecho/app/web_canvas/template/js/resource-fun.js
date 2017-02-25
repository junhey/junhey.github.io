function Resource(){
	var url;
	this.setUrl=function(_url){
		url=_url;
	}
	var root;
	this.setRoot=function(_root){
		root=_root;
	}
	var path;
	this.setPath=function(_path){
		path=_path;
		if(path.lastIndexOf("/")!==(path.length-1)){
			path+="/";
		};
	};
	
	var dataLoadCompletedHandler;
	this.setDataLoadCompletedHandler=function (_dataLoadCompletedHandler){
		dataLoadCompletedHandler=_dataLoadCompletedHandler
	};
	
	this.loadResource=function(){
		$.ajax({
			url:url,
			data:{"path":path},
			dataType:"jsonp",
			jsonp:"getResourceCallbackFn",
			success: dataLoadCompletedHandler
		});
	};
	
	var dataList;
	
	this.getDataList=function(data){
		var d=data.data;
		var dirList=[];
		var fileList=[];
		for( var x in d){
			if(d[x].type=="dir"){
				dirList.push(d[x]);
			};
			if(d[x].type=="file"){
				fileList.push(d[x]);
			};
		}
		var list={
			dirData:dirList,
			fileData:fileList
		};
		dataList=list;
		return list;
	};
	
	function parseData(regx,tpl,data){
		var tmpCode="";
		for(var x in data){
			tmpCode+=tpl;
			for(var y in data[x]){
				for(var z in regx){
					if(y==z){
						tmpCode=tmpCode.replace(regx[z],data[x][z]);
					};
				};
				
			};
		};
		return tmpCode;
	};
	
	this.getCode=function(regx,tpl,data){
		var dirCode=parseData(regx,tpl.dirTpl,data.dirData);
		var fileCode=parseData(regx,tpl.fileTpl,data.fileData);
		if (root!=path){
			var upPath=path.split("/");
			upPath.pop();
			upPath.pop();
			upPath=upPath.join("/");
			upDirCode=tpl.dirTpl.replace(regx.url,upPath);
			upDirCode=upDirCode.replace(regx.workName,"【返回】");
			dirCode=upDirCode+dirCode;
		};
		if (fileCode==""){
			fileCode='<div style="color:red;text-align:center"><br />暂无资源，请点击切换资源文件夹<br /></div>';
		};
		var code={
			dirCode:dirCode,
			fileCode:fileCode
		};
		return code;
	};
	
};