<?php
@header("content-type:text/html;charset=utf-8");
$data=(isset($_POST))?$_POST:NULL;
if($data==NULL){
	exit("Access denied!!!");
}

$name   = trim($data["name"]);
$sex    = trim($data["sex"]);
$age    = trim($data["age"]);
$phone  = trim($data["phone"]);
$address= trim($data["address"]);

require("db.inc.php");

$res=@mysql_query("insert into jingjiu_info (name,sex,age,phone,address) values('$name','$sex','$age','$phone','$address')",$con);
if($res){
	echo "2000";
}
else{
	echo mysql_error();
}

mysql_close($con);
?>