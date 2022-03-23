<?php
session_start();
error_reporting(E_ALL);
ini_set("display_errors","On");
$myname = $_GET['namefile'];
echo $myname;
        $source = '/home/bistique/Downloads/'.$myname;
        $destination = '/var/www/anyar/img/brands'.$myname;
        // 
        exec("sudo cp ")
?>
