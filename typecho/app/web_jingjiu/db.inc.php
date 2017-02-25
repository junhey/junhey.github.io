<?php
$con=@mysql_connect("localhost","root","123456") or exit("数据库系统连接失败");
@mysql_select_db("test",$con) or exit("数据库链接失败");
@mysql_query("set names utf8;",$con) or exit("数据库字符集异常");
?>