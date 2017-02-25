<?php
session_start();
foreach($_SESSION as $key=>$val){
	unset($_SESSION[$key]);
}
echo '<script type="text/javascript">';
echo "window.location.href='login.php'";
echo '</script>';
exit();
?>