<?php

error_reporting(E_ALL);
ini_set("display_errors","On");
//read conf
$i=0;
$conf = array();

if ($_SESSION['reports']== '1'){
    $dir="../class/serv";
}

if ($_SESSION['reports']== '0'){
    $dir="./class/serv";
}

if ($file = fopen($dir, "r")) {

    while(!feof($file)) {
        $conf[$i] = fgets($file);
        $i++;
    }
    fclose($file);
}

$db=trim($conf[0]);
$user=trim($conf[1]);
$pwd=trim($conf[2]);
//define('USER',$user);
//define('PWD',$pwd);
//define('DB',$db);

try 
{
	$pdo = new PDO('mysql:host=localhost;dbname='.$db, $user, $pwd);
    
}
catch (PDOException $e) 
{
    echo 'Error: ' . $e->getMessage();
    exit();
}
