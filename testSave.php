<?php
session_start();
error_reporting(E_ALL);
ini_set("display_errors","On");
// if (isset($_SESSION['code']))
// {
// 	$filename=$_SESSION['code'];	
// }

$upload_dir = "/img/brands/";
$img = $_POST['hidden_data'];
var_dump($img);
$img = str_replace('data:image/png;base64,', '', $img);
$img = str_replace(' ', '+', $img);
$data = base64_decode($img);
$file = $upload_dir . $filename . ".png";
$success = file_put_contents($file, $data);
print $success ? $file : 'Unable to save the file.';
?>