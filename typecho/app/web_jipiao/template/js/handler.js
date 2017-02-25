function tickTypeOnclickHandler(obj,opObj){
	if(obj.val()==="0"){
		opObj.slideUp("fast");
	}
	else{
		opObj.slideDown("fast");
	};
};

function dateListLiOnclickHandler(index,opObj,dateListData){
	opObj.removeClass("date-focus").eq(index).addClass("date-focus");
	//dateListData
};

function typeListLiOnclickHandler(index,opObj,opObj2,dateListData){
	var tIndex=(index!==0);
	if(index===1){
		return false;
	}
	opObj.removeClass("date-focus").eq(index).addClass("date-focus");
	opObj.eq(1).addClass("date-focus");
	opObj2.hide().eq(tIndex).show();
	//dateListData
};

function moreTicketOnclickHandler(index,opObj,opObj2,dateListData){
	if(opObj.attr("data-hs")=="hide"){
		opObj.removeClass("moreTicketHide").addClass("moreTicketShow");
		opObj2.eq(index).slideDown("fast");
		opObj.attr("data-hs","show");
	}
	else{
		opObj.removeClass("moreTicketShow").addClass("moreTicketHide");
		opObj2.eq(index).slideUp("fast");
		opObj.attr("data-hs","hide");
	}
	
};

function cityInit(obj,OPObj,targetObjId){
	var tmpCode="";
	var sw=$(".container").width();
	$(".topBar").removeClass("pztR").addClass("pztF").css("width",sw);
	OPObj.fadeOut("fast");
	for(var x in cityData){
		tmpCode+='<dl class="cityProvince" id="province'+x+'"><dt class="province">'+cityData[x].province;
		for (var y in cityData[x].cities){
			tmpCode+='<dd class="city" data-target="'+targetObjId+'"';
			if(x==0){
				tmpCode+=' style="display:block" ';	
			}
			tmpCode+='>'+cityData[x].cities[y]+'</dd>';
		};
		tmpCode+='</dt></dl>';
	};
	obj.html(tmpCode).fadeIn("fast").css("margin-top","50px");
	$(".cityProvince").on("click",function(){
		provinceOnclickHandler($(this));
	});
	$(".city").on("click",function(){
		cityOnClickHandler($(this));
	});
};

function provinceOnclickHandler(obj){
	var curProvinceId=obj.context.id;
	$(".city").css("display","none");
	$("#"+curProvinceId).find("dd").css("display","block");
};
function cityOnClickHandler(obj){
	var targetId=obj.attr("data-target");
	$("#"+targetId).val(obj.text());
	$("#getCity").fadeOut("fast",function(){
		$(".topBar").removeClass("pztF").addClass("pztR");
		$("#ticket").fadeIn("fast");
	});
}

function bankCardInit(obj,OPObj,targetObjId){
	var tmpCode="";
	var sw=$(".container").width();
	$(".topBar").removeClass("pztR").addClass("pztF").css("width",sw);
	OPObj.fadeOut("fast");
	for(var x in bankCardData){
		tmpCode+='<dl class="bankGroup" id="bank'+x+'"><dt class="bank">'+bankCardData[x].bank;
		for (var y in bankCardData[x].cards){
			tmpCode+='<dd class="card" data-target="'+targetObjId+'"';
			if(x==0){
				tmpCode+=' style="display:block" ';	
			}
			tmpCode+='>'+bankCardData[x].bank+"-"+bankCardData[x].cards[y]+'</dd>';
		};
		tmpCode+='</dt></dl>';
	};
	obj.html(tmpCode).fadeIn("fast").css("margin-top","50px");
	$(".bankGroup").on("click",function(){
		bankOnclickHandler($(this));
	});
	$(".card").on("click",function(){
		cardOnClickHandler($(this));
	});
};

function bankOnclickHandler(obj){
	var curBankId=obj.context.id;
	$(".card").css("display","none");
	$("#"+curBankId).find("dd").css("display","block");
};
function cardOnClickHandler(obj){
	var targetId=obj.attr("data-target");
	$("#"+targetId).val(obj.text());
	$("#bankCardBox").fadeOut("fast",function(){
		$(".topBar").removeClass("pztF").addClass("pztR");
		$("#orderPay").fadeIn("fast");
	});
}