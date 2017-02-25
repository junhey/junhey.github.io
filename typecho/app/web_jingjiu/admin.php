<?php
session_start();
@header("content-type:text/html;charset=utf-8");
$data=(isset($_SESSION["user"]))?$_SESSION["user"]:NULL;
if($data==NULL){
	echo '<script type="text/javascript">';
	echo "window.location.href='login.php'";
	echo '</script>';
	exit();
}

require("db.inc.php");

$page=(isset($_GET["page"]))?$_GET["page"]:1;
$res=@mysql_query("select count(*) as pageMaxSize from jingjiu_info where 1=1;",$con);
$res=@mysql_fetch_assoc($res);
$pageMaxSize=$res["pageMaxSize"];

$pageSize=30;
$pages=ceil($pageMaxSize / $pageSize);
$pageMax=($page-1)*$pageSize;

?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<title>跟着劲酒去旅行</title>
</head>
<body>
<div align="center">
<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">序号</td>
		<td align="center">姓名</td>
		<td align="center">性别</td>
		<td align="center">电话</td>
		<td align="center">地址</td>
	</tr>
	<?php
		$resdata=@mysql_query("select * from jingjiu_info where 1=1 limit $pageMax,$pageSize;",$con);
		$tHtml="";
		if(mysql_num_rows($resdata)!==0){
			while($data=mysql_fetch_assoc($resdata)){
				$tHtml.="<tr>";
				$tHtml.='<td align="center">'.$data["id"].'</td>';
				$tHtml.='<td align="center">'.$data["name"].'</td>';
				$tHtml.='<td align="center">'.$data["sex"].'</td>';
				$tHtml.='<td align="center">'.$data["phone"].'</td>';
				$tHtml.='<td align="center">'.$data["address"].'</td>';
				$tHtml.="</tr>";
			}
		}
		else{
			$tHtml = '<tr><td align="center" colspan="4">暂无数据</td></tr>';
		}
		echo $tHtml;
		mysql_close($con);
	?>
</table>

现在是：<select name="page" onChange="location.href='?page='+this.value">
<?php
$optPage="";
for($i = 0 ; $i<$pages ;$i++){
	$optPage.='<option value="'.($i+1).'"';
	if(($i+1)==$page){
		$optPage.=' selected="selected" ';
	}
	$optPage.='>第'.($i+1).'页</option>';
}
echo $optPage;
?>
</select>　　共计：<?php echo $pages?>页　　每页<?php echo $pageSize?>条数据<br>
<input type="button" value="退出" onClick="window.location.href='exit.php'">
</div>
</body>