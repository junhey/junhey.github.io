<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebService数据说明</title>
<style type="text/css">
	body {
		background-color: #fff;
		margin: 40px;
		font: 13px/20px normal Helvetica, Arial, sans-serif;
		color: #4F5155;
		font-family:"宋体";
	}

	a {
		color: #003399;
		background-color: transparent;
		font-weight: normal;
		text-decoration:none;
	}

	h1 {
		color: #444;
		background-color: transparent;
		border-bottom: 1px solid #D0D0D0;
		font-size: 19px;
		font-weight: normal;
		margin: 0 0 14px 0;
		padding: 14px 15px 10px 15px;
	}
	h2 {
		color: #444;
		background-color: transparent;
		font-size: 18px;
		font-weight: normal;
	}
	</style>
</head>
<body>
<?php
$url=site_url("index.php/webservices")."/";
?>
<fieldset>
<h1>特别提醒：所有参数均为小写字母！</h1>
数据通信类型：<?php echo $dataType?><hr />
数据通信格式：<?php echo $format?><br />
</fieldset>
<fieldset><?php echo $desc?></fieldset>
<fieldset><h2>WebService方法：</h2></fieldset>
<?php 
	$tmpCode="";
	foreach($webservice as $key=>$val){
		$tmpCode.="<fieldset>";
			$tmpCode.="【方 法 名】：【<a href=\"".$url.$val["serviceName"]."\" target=\"blank\">".$val["serviceName"]."</a>】<hr />";
			$tmpCode.="【通信方法】：【".$val["method"]."】<hr />";
			$tmpCode.="【格式说明】：【".$val["format"]."】<hr />";
			$tmpCode.="【data说明】：【".$val["result"]."】<fieldset>";
			foreach($val["para"] as $k1=>$v1){
				$tmpCode.="【字段名称】：【".$val["para"][$k1]["field"]."】，";
				$tmpCode.="说明：".$val["para"][$k1]["desc"]."<hr />";
			}			
		$tmpCode.="</fieldset></fieldset>";
	}
	echo $tmpCode;
?>
</body>
</html>