<?php
session_start();
error_reporting(E_ALL);
ini_set("display_errors","On");
date_default_timezone_set("Asia/Bangkok");

if(!empty($_SESSION["cart_item"])){
			
	 $myinvno=$_SESSION['myinvdrm'];
	 $myrefno=$myinvno;
	 $mydate1=date('Y-m-d');
	 
	 $myuser='ary';//$_SESSION['user'];
	 $mysupp=$_POST['status'];;
	 $mybayar=$_POST['pay'];//;
	 $mykembali=$_POST['change'];//$_POST['change'];
	 $mytype = $_POST['status'];
	 $myclient=$_POST['client'];

	 //$myduedate = strtotime(date('Y-m-d',$_POST['duedate']));
	 if ($mytype=='Cash'){
		$mydateon=date('Y-m-d');
	 }

	 if($mytype=='A/R'){
		$mydateon=$_POST['duedate'];
	 }
	 	
     $conn2 = mysqli_connect('localhost','mimj5729_myroot','myroot@@##','mimj5729_matahari');
	 $result = mysqli_query($conn2,"insert into wsellhead (s_code, s_date,s_dateinput,type,c_code, u_code,s_premi,s_deduct) values ('$myinvno', '$mydate1','$mydateon', '$mytype','$myclient','$myuser','$mybayar', '$mykembali');");
    
     if($result){
         echo 'OKsave';
     }else{
         echo 'Failed';
     }

	// $drmSales = new Sales($myinvno,$mydate1,$mydateon,$mysupp,$myuser,$mybayar,$mykembali,'0','0','0','0','0','0','0');
	 //$drmSales->save_sell_head();
    //var_dump($drmSales);
	foreach($_SESSION["cart_item"] as $myItem)
	 {
	 	$myInvNo=$myinvno;
	 	$myItemCode= $myItem["code"];//
	 	$myItemName= $myItem["name"];
	 	$myQty= $myItem["qty"];//$_SESSION["cart_item"][$k]["name"];
	 	$myPrice=$myItem["cogs"];
	 	$myDisc1=$myItem["disc"];
	 	$myDisc2=$myItem["disc2"];
	 	$myDisc3=$myItem["discrp"];
	 	// 
		 $conn2 = mysqli_connect('localhost','mimj5729_myroot','myroot@@##','mimj5729_matahari');
		 $result = mysqli_query($conn2,"insert into wselltail (s_code,i_code,i_name, i_qty, i_sell,i_disc1,i_disc2,i_disc3) values ('$myInvNo', '$myItemCode','$myItemName', '$myQty','$myPrice','$myDisc1', '$myDisc2','$myDisc3');");
	 				/*UPDATE INVENTORY*/
	// 	$myinvent = new Inventory('','','','','','','','','','','','','','','','','','','','','','','','','','');
	// 	$myinvent->update_inventory($myItemCode,$myQty);
	 }
	
	 unset($_SESSION["cart_item"]);
	 unset($_SESSION["xdate"]);
	 unset($_SESSION["myinvdrm"]);
	 $_SESSION["xdate"]=date('Y-m-d');
	// $_SESSION["myinvdrm"]=setnoinv();

   
}else{
    echo 'Failed';
}
?>