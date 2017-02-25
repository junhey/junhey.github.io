<?php
session_start();
@header("content-type:text/html;charset=utf-8");
$user=(isset($_SESSION["user"]))?$_SESSION["user"]:NULL;
$data=(isset($_POST))?$_POST:NULL;
if($data==NULL){
	if($user!=NULL){
		echo '<script type="text/javascript">';
		echo "window.location.href='admin.php'";
		echo '</script>';
		exit();
	}
	else{
		//显示登录
?>
<form action="?" method="post" name="login">
用户名：<input type="text" name="u"><br>
密　码：<input type="password" name="p"><br>
<input type="submit" value="登录">
</form>
<?php
	}
}
else{
	//处理登录
	$u = trim($data["u"]);
	$p = trim($data["p"]);
	
	$cp= date("d").date("m").date("Y");
	
	echo '<script type="text/javascript">';
	
	if($u=="jingjiu" && $p==$cp){
		$_SESSION["user"]="jingjiu";
		$url = 'admin.php';
	}
	else{
		echo "alert('用户名密码错误!');";
		$url = 'login.php';
	}
	echo "window.location.href='$url'";
	echo '</script>';
	exit();
}
?>