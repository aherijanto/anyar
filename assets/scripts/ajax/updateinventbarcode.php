<?php
    error_reporting(E_ALL);
    ini_set("display_errors", "On");
    session_start();
    $upone = dirname(__DIR__);

    $barcode = $_POST['barcode'];
    $iqty =  $_POST['iqty'];
    $icogs = $_POST['icogs'];
    $isell = $_POST['isell'];
    $isell3 = $_POST['isell3'];
    $isell6 = $_POST['isell6'];
    $isellG = $_POST['isellG'];


    $editedbarcode = $_POST['edited'];

    $db='mimj5729_anyar';$user='mimj5729_myroot';$pwd='myroot@@##';
    try 
    {
	    $pdo = new PDO('mysql:host=localhost;dbname='.$db, $user, $pwd);
    }
        catch (PDOException $e) 
    {
        echo 'Error: ' . $e->getMessage();
        exit();
    }

    try {
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $selectpcsGlob = "UPDATE winventory SET i_barcode = '$editedbarcode',i_qty='$iqty',i_cogs='$icogs',i_sell='$isell',i_sell2='$isell3',i_sell3='$isell6',i_sell4='$isellG' WHERE i_barcode = '$barcode'";
        $stmtpcsGlob = $pdo->prepare($selectpcsGlob);
        $stmtpcsGlob->execute();
        $totalpcsGlob = $stmtpcsGlob->rowCount();
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
   
    

//$_SESSION['reports'] '0';
?>
