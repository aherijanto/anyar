<?php
ob_start();
session_start();
error_reporting(E_ALL);
ini_set("display_errors","On");
date_default_timezone_set("Asia/Bangkok");
$_SESSION['reports']='0';
if (isset($_SESSION['user'])!="" )
{

include "class/_parkersales.php";
include "class/_parkerinvent.php";
//include 'menuhtml.php';
include 'class/number.php';

$itemcode1="";
$item_total = 0;

function subtotal($qty,$price)
{
$subtotal1=0;
 $subtotal1 = $qty * $price;
return $subtotal1;
}

function setnoinv(){
	$myRandNo=rand(10000,99999);
	$nowM=date('Ymd');
	$mydaternd=strtotime($nowM);
	
	$xdate='ANR'.$nowM.$myRandNo;
	
	$_SESSION['myinvdrm']=$xdate;
	return $xdate;
}

function promoDoremi($itempromo,$myqty,$mysell,$disc01,$disc02,$disc03)
{
	include ('class/_parkerconnection.php');
				$mfpromo=$_SESSION['selectpromo'];
				switch ($mfpromo) {
				case 'promo1':
					break;
				case 'promo2':
  	        	  try {
             		   $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                		$searchpromoitem="SELECT * FROM wpromoitemhead,wpromoitemtail WHERE (wpromoitemtail.i_code='$itempromo') AND (wpromoitemtail.s_code=wpromoitemhead.s_code) ";
                	$stmt = $pdo->prepare($searchpromoitem);
                //$stmt->bindParam(':c_code', $mcode, PDO::PARAM_STR);
                	$stmt->execute();
                	$totalpromoitem = $stmt->rowCount();
               		$rowpromo = $stmt->fetchObject(); 
            	} catch(PDOException $e) {
                	echo $e->getMessage();
            	}

            	if ($totalpromoitem > 0){
            		
            		$promcode=$itempromo;
            		$promCode0=$rowpromo->s_code;
            		$promname=$rowpromo->i_name.'- PROMO';
            		$promartikel=$rowpromo->i_article;
            		$promowarna=$rowpromo->i_color;
            		$discPromo=$rowpromo->i_disc;
            		
            		$itemArrayPromoItem = array($promcode=>array('code'=>$promcode,'name'=>'PROMO', 'artikel'=>$promartikel,'warna'=>$promowarna,'qty'=>$myqty,'cogs'=>$mysell,'disc1'=>$discPromo,'disc2'=>0,'disc3'=>0));
            		
            		if(in_array($promCode0, array_column($_SESSION['cart_item'], 'code'))) {
            		}else{
            		
            			$_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArrayPromoItem);
            		}
            		
            	}
            	//}
            	break;
			default:
				# code...
				break;
		}
}

function calculateGrandTotal(){
	if(isset($_SESSION['cart_item'])){
		$grandtotalitem = 0;
		foreach($_SESSION['cart_item'] as $myItem){
			$mysubtotal1= $myItem["qty"] * $myItem["cogs"];
			$totaldisc11 = $mysubtotal1*(1-($myItem['disc1']/100));
			$totaldisc21 = $totaldisc11*(1-($myItem['disc2']/100));
			$totaldisc31 = $totaldisc21-$myItem['disc3'];
			$grandtotalitem=$grandtotalitem+$totaldisc31;
			$_SESSION['lblgrand']=$grandtotalitem; 
		}	
	}else{
		$_SESSION['lblgrand']=0;
	}
}


if(!empty($_GET["action"])) {
	switch($_GET["action"])
	{
		case "new":
			unset($_SESSION["cart_item"]);	
			unset($_SESSION["xdate"]);
			unset($_SESSION["scode"]);
			unset($_SESSION["myinvdrm"]);
			unset($_SESSION["totalcart"]);			
			$_SESSION["xdate"]=date('Y-m-d');			
			$_SESSION['myinvdrm']=setnoinv();
			$_SESSION["totalcart"]=0;
			$_SESSION["bayar"]='';
			$_SESSION["kembali"]=0;
			$_SESSION['selectpromo']='nonpromo';
			$total=0;
			$stmt=0;
			$_SESSION['lblgrand']=0;
			break;
	
		case "addname":		
			if (isset($_POST['addtolist']))
			{
				$itemcode1=$_POST['code'];
				$disc1=0;//$_POST['disc1'];
				$disc2=$_POST['disc2'];
				$disc3=$_POST['disc3'];

				if ($disc1=='') {
					$disc1=0;
				}

				if ($disc2=='') {
					$disc2=0;
				}

				if ($disc3=='') {
					$disc3=0;
				}
		
				
									
				$mycodetr = $_POST['code'];
				include ('class/_parkerconnection.php');
				try {
					$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
					$sqlMF = "SELECT * FROM winventory WHERE i_barcode = '$mycodetr'";
					$stmtMF = $pdo->prepare($sqlMF);
					$stmtMF->execute();
					$totalMF = $stmtMF->rowCount();
					$rowMF = $stmtMF->fetchObject();
				} catch(PDOException $e) {
					echo $e->getMessage();
				}
				$mysessionqty = $_POST["qty"];
				if (($mysessionqty == 1) || ($mysessionqty < 3)){
					$mycogs=$rowMF->i_sell;
				}

				if (($mysessionqty >= 3) && ($mysessionqty < 6)){
					$mycogs = $rowMF->i_sell2;
					if ($mycogs == 0){
						$mycogs = $rowMF->i_sell;
						
					}else{
						$mycogs = $rowMF->i_sell2;
					}
				}

				if ($mysessionqty >= 6){
					$mycogs = $rowMF->i_sell3;
					if ($mycogs == 0){
						$mycogs = $rowMF->i_sell4;
					}else{
						$mycogs = $rowMF->i_sell3;
					}
				}

				$itemArray = array($itemcode1=>array('code'=>$_POST["code"],'name'=>$_POST['itemname'], 'artikel'=>$_POST['iartikel'],'warna'=>$_POST['iwarna'],'qty'=>$_POST["qty"],'cogs'=>$mycogs,'disc1'=>$disc1,'disc2'=>$disc2,'disc3'=>$disc3));		
				if(!empty($_SESSION["cart_item"])){
					$itemcheck=$_SESSION['cart_item'];
					if(in_array($itemcode1, array_column($itemcheck, 'code'))) {
    					$itemCheckSession = $_SESSION['cart_item'];
						foreach ($_SESSION["cart_item"] as $key => $val) {
							if($itemcode1 == $_SESSION["cart_item"][$key]["code"]){
								$_SESSION["cart_item"][$key]['qty']=$_POST['qty'] ;
								$mysessionqty = $_SESSION["cart_item"][$key]['qty'];
								if (($mysessionqty == 1) || ($mysessionqty < 3)){
									$mycogs=$rowMF->i_sell;
									$_SESSION["cart_item"][$key]['cogs'] = $mycogs;
								}

								if (($mysessionqty >= 3) && ($mysessionqty < 6)){
									$mycogs = $rowMF->i_sell2;
									if ($mycogs == 0){
										$mycogs = $rowMF->i_sell;
										$_SESSION["cart_item"][$key]['cogs'] = $mycogs;
						
									}else{
										$mycogs = $rowMF->i_sell2;
										$_SESSION["cart_item"][$key]['cogs'] = $mycogs;
									}
								}

								if ($mysessionqty >= 6){
									$mycogs = $rowMF->i_sell3;
									if ($mycogs == 0){
										$mycogs = $rowMF->i_sell4;
										$_SESSION["cart_item"][$key]['cogs'] = $mycogs;
									}else{
										$mycogs = $rowMF->i_sell3;
										$_SESSION["cart_item"][$key]['cogs'] = $mycogs;
									}
								}
							}
						}									
					}else{
						$_SESSION['cart_item']=array_merge($_SESSION['cart_item'],$itemArray);
					}
				}else{
					$_SESSION["cart_item"] = $itemArray;
				}
            	calculateGrandTotal();
			}//if
			break;

		case "add":
			if (isset($_POST['idsubmit']))
        	{            	
            	$i_code=$_POST['itemcode'];
            	include ('class/_parkerconnection.php');
				try {
             		   $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                		$searchpromoitem="SELECT * FROM wpromoitemhead,wpromoitemtail WHERE (wpromoitemtail.i_code='$i_code') AND (wpromoitemtail.s_code=wpromoitemhead.s_code) ";
                		$stmt = $pdo->prepare($searchpromoitem);
                
                		$stmt->execute();
                		$totalpromoitem = $stmt->rowCount();
               			$rowpromo = $stmt->fetchObject(); 
            		} catch(PDOException $e) {
                		echo $e->getMessage();
            		}
            		$discPromo=0;
            		if ($totalpromoitem > 0){	
            			$promcode=$i_code;
            			$promCode0=$rowpromo->s_code;
            			$promname=$rowpromo->i_name;
            			$promartikel=$rowpromo->i_article;
            			$promowarna=$rowpromo->i_color;
            			$discPromo=$rowpromo->i_disc;
            		} 

            		try {
                		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                		$sql = "SELECT * FROM winventory WHERE i_barcode = '$i_code'";
                		$stmt = $pdo->prepare($sql);
                		$stmt->execute();
                		$total = $stmt->rowCount();
                		$row = $stmt->fetchObject();
               		
               			if ($total > 0){
               				$mycode=$row->i_barcode;
               				$myqty=$row->i_qty;
							$mysell=$row->i_sell;
               				$myarticle=$row->i_article;
               				$itemname=$row->i_name;
               				$iwarna=$row->i_color;
               				$itemArray = array($mycode=>array('code'=>$mycode,'name'=>$itemname, 'artikel'=>$myarticle,'warna'=>$iwarna,'qty'=>1,'cogs'=>$mysell,'disc1'=>$discPromo,'disc2'=>0,'disc3'=>0));
               				if(!empty($_SESSION["cart_item"])){
								$itemCheckSession = $_SESSION['cart_item'];
								if(in_array($mycode, array_column($itemCheckSession, 'code'))) {
									foreach ($_SESSION["cart_item"] as $key => $val) {
										if($mycode == $_SESSION["cart_item"][$key]["code"]){
											$_SESSION["cart_item"][$key]['qty'] =$_SESSION["cart_item"][$key]['qty']+1 ;
											$mysessionqty = $_SESSION["cart_item"][$key]['qty'];
											if (($mysessionqty == 1) || ($mysessionqty < 3)){
												$mysell=$row->i_sell;
												$_SESSION["cart_item"][$key]['cogs'] = $mysell;
											}
											if (($mysessionqty >= 3) && ($mysessionqty < 6)){
												$mysell = $row->i_sell2;
												if ($mysell == 0){
													$mysell = $row->i_sell;
													$_SESSION["cart_item"][$key]['cogs'] = $mysell;
												}else{
													$mysell = $row->i_sell2;
													$_SESSION["cart_item"][$key]['cogs'] = $mysell;
												}
											}

											if ($mysessionqty >= 6){
												$mysell = $row->i_sell3;
												if ($mysell == 0){
													$mysell = $row->i_sell4;
													$_SESSION["cart_item"][$key]['cogs'] = $mysell;
												}else{
													$mysell = $row->i_sell3;
													$_SESSION["cart_item"][$key]['cogs'] = $mysell;
												}
											}
										}
									}									
								}else{
									$_SESSION['cart_item']=array_merge($_SESSION['cart_item'],$itemArray);
								}			
							}else
							{
								$_SESSION["cart_item"] = $itemArray;
							}	
               			}else{
							   echo '<script> alert("Barcode Tidak Ditemukan");</script>';
						   }
            	} catch(PDOException $e) {
                			echo $e->getMessage();
            		}
						calculateGrandTotal();
       				}
			break;

		case "updatearray":
			if (isset($_POST['qtysubmit']))
			{
				if ($_POST['xqty']!=''){
  				 foreach ($_SESSION["cart_item"] as $key => &$val) {
  					if($_GET["codetr"] == $_SESSION["cart_item"][$key]["code"]){
						$mycodetr = $_GET['codetr'];
						include ('class/_parkerconnection.php');
						try {
							$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
							$sqlMF = "SELECT * FROM winventory WHERE i_barcode = '$mycodetr'";
							$stmtMF = $pdo->prepare($sqlMF);
							$stmtMF->execute();
							$totalMF = $stmtMF->rowCount();
							$rowMF = $stmtMF->fetchObject();
						} catch(PDOException $e) {
							echo $e->getMessage();
						}

						$_SESSION["cart_item"][$key]['qty'] = $_POST['xqty'];
						$_SESSION["cart_item"][$key]['disc1'] = $_POST['xdisc1'];
						$_SESSION["cart_item"][$key]['disc2'] = $_POST['xdisc2'];
						$_SESSION["cart_item"][$key]['disc3'] = $_POST['xdisc3'];
						$mysessionqty = $_SESSION["cart_item"][$key]['qty'];
						if (($mysessionqty == 1) || ($mysessionqty < 3)){
							$mysell=$rowMF->i_sell;
							$_SESSION["cart_item"][$key]['cogs'] = $mysell;
						}
						if (($mysessionqty >= 3) && ($mysessionqty < 6)){
							$mysell = $rowMF->i_sell2;
							if ($mysell == 0){
								$mysell = $rowMF->i_sell;
								$_SESSION["cart_item"][$key]['cogs'] = $mysell;
							}else{
								$mysell = $rowMF->i_sell2;
								$_SESSION["cart_item"][$key]['cogs'] = $mysell;
							}
						}

						if ($mysessionqty >= 6){
							$mysell = $rowMF->i_sell3;
							if ($mysell == 0){
								$mysell = $rowMF->i_sell4;
								$_SESSION["cart_item"][$key]['cogs'] = $mysell;
							}else{
								$mysell = $rowMF->i_sell3;
								$_SESSION["cart_item"][$key]['cogs'] = $mysell;
							}
						}
					} 	
           			 // Add this
       			 }
				}
				calculateGrandTotal();
			}

			break;
			
		case "remove":
				if(isset($_SESSION["cart_item"])){
					foreach($_SESSION["cart_item"] as $k=>$v){ 
						if($_GET["codetr"] == $_SESSION["cart_item"][$k]["code"]){
							unset($_SESSION["cart_item"][$k]);
						}

						if(empty($_SESSION["cart_item"])){
							unset($_SESSION["cart_item"]);
						}
					}
					calculateGrandTotal();
				}
				break;
		
		case "save":
			if(!empty($_SESSION["cart_item"])) 
			{
				if (($_SESSION['bayar']=='') || ($_SESSION['bayar']==0)){
					//echo "<script type='text/javascript'>alert('ooooo');</script>";
					break;
				}
				$myinvno=$_SESSION['myinvdrm'];
				$myrefno=$myinvno;
				$mydate1=date('Y-m-d');
				$mydateon=date('Y-m-d');
				$myuser=$_SESSION['user'];
				$mysupp='cash';
				$mybayar=$_SESSION['bayar'];
				$mykembali=$_SESSION['kembali'];
				$mytype = 'Cash';
				$drmSales = new Sales($myinvno,$mydate1,$mydateon,$mytype,$mysupp,$myuser,$mybayar,$mykembali,'0','0','0','0','0','0','0'); 
				$drmSales->save_sell_head();
				foreach($_SESSION["cart_item"] as $myItem) 
				{
						$myInvNo=$myinvno;
						$myItemCode= $myItem["code"];//
						$myItemName= $myItem["name"];
						$myQty= $myItem["qty"];//$_SESSION["cart_item"][$k]["name"];
						$myPrice=$myItem["cogs"];
						$myDisc1=$myItem["disc1"];
						$myDisc2=$myItem["disc2"];
						$myDisc3=$myItem["disc3"];
						
						$salesDetail = new Sales($myinvno,$mydate1,$mydateon,$mytype,$mysupp,$myuser,'0','0',$myItemCode,$myItemName,$myQty,$myPrice,$myDisc1,$myDisc2,$myDisc3); 
				
						$salesDetail->save_sell_tail();
						
					/*UPDATE INVENTORY*/
						$myinvent = new Inventory('','','','','','','','','','','','','','','','','','','','','','','','','','');	
						$myinvent->update_inventory($myItemCode,$myQty);
				}
				
				header ("Location:printsalestable.php?invno=$myInvNo");
				unset($_SESSION["cart_item"]);
				unset($_SESSION["xdate"]);
				unset($_SESSION["myinvdrm"]);
				$_SESSION["xdate"]=date('Y-m-d');
				$_SESSION["myinvdrm"]=setnoinv();
			}
				break;

		case "empty":
		unset($_SESSION["cart_item"]);
		$_SESSION["totalcart"]=0;
		$_SESSION["bayar"]=0;
		$_SESSION["kembali"]=0;
		$_SESSION['lblgrand']=0;
		break;
	}

}
?>

<html>
 <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 	
<script type="text/javascript">
function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $('#blah')
                  .attr('src', e.target.result)
                  .width(150)
                  .height(100);
          };
          reader.readAsDataURL(input.files[0]);
      }
  }
  
					
				
  </script>

<style type="text/css">
.auto-style1 {
	font-family: Calibri;
	font-size:medium;
}
.auto-style2 {
	border-style: none;
	border-color: inherit;
	border-width: 0;
	color: #D60202;
	padding: 2px 10px;
	font-size: small;
}
.auto-style3 {
	font-family: Calibri;
	font-size: 16px;
	color:white;
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    color:white;
    font-size: 10px;
    padding: 10px;
}

tr:nth-child(even) {
    background-color: #000000;
}

input[type=text] {
  
  width:260px;height:40px;
  box-sizing: border-box;
  border: 1px solid #555;
  outline: none;
  font-size: 20px;
}

input[type=text]:focus {
  background-color: #F5B7B1;
  color:black;
 }

input[type=submit] {
  background-color: #4CAF50;
  border-radius: 4px;
  border: none;
  color: white;
  padding: 5px 5px;
  text-decoration: none;
  margin: 10px 8px;
  cursor: pointer;
  width:120px;
  height:40px;
}

#footer {
	color:white;
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 2.5rem;            /* Footer height */
}

img.sticky {
  position: -webkit-sticky;
  position: sticky;
  bottom:1rem;
}
 #mybutton {
  position: fixed;
  bottom: -4px;
  right: 10px;
}
  #xqty:focus{
	  width:200px;
	  height:60px;
	  background-color:#fdffb6;
	  font-size:24px;
  }
}
</style>

<style>
             
			html {
               background-color: #000000;
             }
             .card__image {
               background-position: center center;
               background-repeat: no-repeat;
               background-size: cover;
               border-top-left-radius: 0.25rem;
               border-top-right-radius: 0.25rem;
               max-width: 220px;
               max-height: 100px;
               
               filter: contrast(70%);
               //filter: saturate(180%);
               overflow: hidden;
               position: relative;
               transition: filter 0.5s cubic-bezier(.43,.41,.22,.91);;
               &::before {
                 content: "";
             	  display: block;
                 padding-top: 56.25%; // 16:9 aspect ratio
               }

               @media(min-width: 40rem) {
                 &::before {
                   padding-top: 66.6%; // 3:2 aspect ratio
                 }
               }
             }

             .card__image--customer {
               background-image: url("customer.png");
             }
             .card {
               background-color: white;
               border-radius: 0.25rem;
               box-shadow: 0 30px 60px -14px rgba(0,0,0,0.25);
             }

               .cards {
                 display:flex;
                 flex-wrap: wrap;
                 list-style: none;
                 margin: 0;
                 padding: 0;
               }
               .cards__item {
                 display: flex;
                 padding: 1rem;
                 @media(min-width: 40rem) {
                   width: 50%;
                 }

             .card:hover {
               box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
             }

             img {
               border-radius: 5px 5px 0 0;
             }

             .container {
               padding: 2px 16px;

               .card__title {
                 color: @gray-dark;
                 font-size: 1.25rem;
                 font-weight: 300;
                 letter-spacing: 2px;
                 text-transform: uppercase;
               }

               .card__text {
                 flex: 1 1 auto;
                 font-size: 0.875rem;
                 line-height: 1.5;
                 margin-bottom: 1.25rem;
               }
 </style>
</head>
<body bgcolor="#00000">
	<div>
	<form action="" method="post">
	<div>
		<table width="100%" font="calibri">
		<tr>
			<td align="center" style="width: 180px;font-size: 20px;background-color: #A569BD"><?php echo $_SESSION['myinvdrm'];?></td>
			<td align="center" style="font-size: 20px;color: white;background-color: #27AE60;">POINT OF SALES</td>
			<td align="center" style="width: 180px;font-size: 20px;background-color: #D35400;"><?php echo $_SESSION['xdate'];?></td>
			
		</tr>
		</table>
	</div>
	</form>
		<br/>
		<div class="txt-heading" align="right">
	</div>
	</div>

<div class="product-item">
	<table>
		<tr>
			<form method="post" action="salesdirect.php?action=add">
				<td>
					<input name="itemcode" type="text" style="color:yellow;background-color:black;font-size:60px;width:450px;border:none;padding:0px5px;height:80px;" id="itemcode" placeholder="..........." autofocus>
					<input type="submit" name="idsubmit" style="background-color: #C0392B;" value="Search ID" hidden>
				</td>
			</form>
			<td align="right">		
				<label id="grandtotal" style="color:white;font-size:60px;"><?php echo number_format($_SESSION['lblgrand']);?></label>
			</td>
		</tr>
			</table>
	<table>
	
	<tr>		
		<form method="post" action="salesdirect.php?action=search">
		<td align="left">
			<input name="itemname" type="text" align="center" id="itemname">
			<input type="submit" name="namesubmit" style="background-color: #B9770E;" value="Search Name" />
		</td>
		</form>

		<td align="right" class="txt-heading">
			<a id="btnNew" href="/salesdirect.php?action=new" style="color:white;background-color:   #2874a6   ; border-radius: 5px;text-decoration: none;padding: 10px; font-size: 16px;" width="120px">New</a>     
			<a id="btnEmpty" href="/salesdirect.php?action=save" style="color:white;background-color: #229954; border-radius: 5px;text-decoration: none;padding: 10px;font-size: 16px;">Save</a> 
			<a id="btnEmpty" href="/salesdirect.php?action=empty" style="color:white;background-color:  #cb4335  ; border-radius: 5px;text-decoration: none;padding: 10px;font-size: 16px;">Clear</a>
		</td>
	</tr>
</table>
</div>

<div id="shopping-cart">						
<?php
if(isset($_SESSION["cart_item"])){
    $item_total = 0;
?>

<table class="table" id="tablelist" cellpadding="10" cellspacing="1"  style="overflow-y:scroll;height:340px;display:block;width:auto;">
<tbody>
<tr bgcolor="#228FF5">
<th align="center" class="auto-style1"><strong>KODE BARANG</strong></th>
<th class="auto-style1"><strong>NAMA BARANG</strong></th>
<th class="auto-style1"><strong>ARTIKEL</strong></th>
<th class="auto-style1"><strong>WARNA</strong></th>
<th class="auto-style1"><strong>QTY</strong></th>
<th class="auto-style1"><strong>HARGA</strong></th>
<th class="auto-style1"><strong>JUMLAH</strong></th>
<th class="auto-style1"><strong>DISC %1</strong></th>
<th class="auto-style1"><strong>DISC %2</strong></th>
<th class="auto-style1"><strong>DISC Rp</strong></th>
<th class="auto-style1"><strong>SUBTOTAL</strong></th>
<th class="auto-style1"><strong>ACTION</strong></th>
</tr>
<?php
$grandtotal=0;
$totItem=0;
    foreach ($_SESSION["cart_item"] as $item)
    {
		?>
				<form action="salesdirect.php?action=updatearray&codetr=<?php echo $item["code"]; ?>" method="post">
				<tr>
				<td class="auto-style3"><strong><?php echo $item["code"]; ?></strong>
					<input type="text" name="xcode" value="<?php echo $item['code'] ?>" hidden="true">
				</td>
				<td align="left" class="auto-style3"><?php echo $item["name"]; ?></td>
				<td align="left" class="auto-style3"><?php echo $item["artikel"]; ?></td>
				<td align="left" class="auto-style3"><?php echo $item["warna"]; ?></td>
				<td align="center" class="auto-style3">
					<input type="text" name="xqty" id="xqty" value="<?php echo $item['qty'] ?>" style="width:50px;text-align: center;font-size: 12px;">
				</td>
		
				<td align="right" class="auto-style3"><?php echo "Rp. ".number_format($item["cogs"]); ?></td>
				<?php
					$mysubtotal= $item["qty"] * $item["cogs"];
					$totaldisc1 = $mysubtotal*(1-($item['disc1']/100));
					$totaldisc2 = $totaldisc1*(1-($item['disc2']/100));
					$totaldisc3 = $totaldisc2-$item['disc3'];
        			//$totaldisc3 = $totaldisc2*(1-($item['disc3']/100)); 
				?>
				<td align="right" class="auto-style3"> <?php echo 'Rp. '.number_format($mysubtotal,0); ?> </td>
				
				
				<td><input type="text" name="xdisc1" id="xdisc1" value="<?php echo number_format($item['disc1'],2) ?>" style="width:60px;text-align: center;font-size: 12px;"></td>
				
				<td><input type="text" name="xdisc2" id="xdisc2" value="<?php echo number_format($item['disc2'],2) ?>" style="width:60px;text-align: center;font-size: 12px;"></td>

				<td><input type="text" name="xdisc3" id="xdisc3" value="<?php echo $item['disc3'] ?>" style="width:60px;text-align: center;font-size: 12px;"></td>

				<td align="right" class="auto-style3"><?php echo number_format($totaldisc3); ?></td>
				<td align="center" class="auto-style3"><a href="/salesdirect.php?action=remove&codetr=<?php echo $item["code"]; ?>" class="auto-style3" style="color:white;background-color:  #8e44ad; border-radius: 5px;text-decoration: none;padding: 10px 5px;margin:5px;">Remove Item</a></td>

				<input type="submit" name="qtysubmit" value="qtysubmit" hidden="true">	
									
				</tr>
				</form>
				<?php
        		$totItem++;
				$grandtotal=$grandtotal+$totaldisc3;
				$_SESSION['totalcart']=$grandtotal;

		}
		echo '<script>
				var div = document.getElementById("tablelist");
				div.scrollTop = div.scrollHeight - div.clientHeight;
			 </script>';
		?>
				</table>
	
				<table>
				<tr><td colspan="12"><hr/></td></tr>
				<tr>
					<td align="left" style="color: yellow ;font-size: 12px;"><?php echo 'Item : '.$totItem.' record(s)';?></td>
					<td colspan="3" align="left" style="color: yellow ;font-size: 15px;font-style: italic;">Untuk update QTY,DISC, silahkan isi angka kemudian tekan ENTER
					<td align="right" colspan="7" style="color: white ;font-size: 28px;" hidden>TOTAL</td>
					<td colspan="11" align="right" class="auto-style3" hidden><input type="text" name="gtotal"  style="text-align:right;width: 180px;background-color: #AED6F1;font-size:28px;" value="<?php echo number_format($grandtotal); ?>" readonly hidden></td>
				</tr>
				
					<?php 
						if (isset($_POST['bayar'])){
							if ($_POST['bayar']<$grandtotal){
								$_SESSION['bayar']='';
							}

							if($_POST['bayar']>=$grandtotal){
							
							$_SESSION['bayar']=$_POST['bayar'];
							$kembali=$_SESSION['bayar']- $grandtotal;
							$_SESSION['kembali']=$kembali;
							}
						}
					?>
				
				<form method="post" action="">
				<tr>
					<td align="right" colspan="11" class="auto-style3" style="font-size: 28px;color:white;" >BAYAR</td>
					<td align="right" class="auto-style3" style=""><input type="text" name="bayar" id="bayar" style="text-align:right;width: 180px;background-color: #000000;font-size: 28px;color:white;"  onblur="this.form.submit();" value="<?php echo ($_SESSION['bayar']); ?>" /></td>
				</tr>
				</form>
				
				<tr>
					<td align="right" colspan="11" class="auto-style3" style="color: white;font-size: 28px;">KEMBALI</td>
					<td align="right" class="auto-style3" style=""><input type="text" name="kembali"  style="text-align:right;width: 180px;background-color: #000000;font-size: 28px;color:white;" onblur="this.form.submit();" value="<?php echo number_format($_SESSION['kembali']); ?>" readonly/>
					</td>
				</tr>
</tbody>
</table>

  <?php
}
?>
</div>
<br/>

<?php
	if ($_GET['action']=='search'){
       	if (isset($_POST['namesubmit']))
        {    
            $i_name=(string)$_POST['itemname'];
            
            //$mname= '%'.$i_name.'%';
			include ('class/_parkerconnection.php');

            try {
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql1 = "SELECT * FROM `winventory` WHERE i_name LIKE '%$i_name%'";
                $stmt = $pdo->prepare($sql1);
                //$stmt->bindParam(':c_name', $mname, PDO::PARAM_STR);
                $stmt->execute();
                $total = $stmt->rowCount();
                /*while ($row = $stmt->fetchObject()) {
                  echo $row->c_code;
                }*/
            } catch(PDOException $e) {
                echo $e->getMessage();
            }
         }
          
           
           	echo '<table width="100%;">';
           echo '<tr><td colspan="10" style="background-color:#873600  ;">RESULT::  '.$total.' record(s)</td></tr>';
             while ($row = $stmt->fetchObject()) {
               //echo $row->c_code;
               $mycode=$row->i_barcode;
               //$mygroup=$row->g_code;
               $mysell=$row->i_sell;
               $myqty=$row->i_qty;
               $myarticle=$row->i_article;
               $itemname=$row->i_name;
               $iwarna=$row->i_color;
              	echo '<tr><form method="post" action="salesdirect.php?action=addname">'; 
                echo '<td width="100px" class="auto-style3" >'.$mycode.'</td><input type="hidden" name="code" value="'.$mycode.'" />';
                echo '<td width="150px" class="auto-style3" >'.$itemname.'</td><input type="hidden" name="itemname" value="'.$itemname.'" />';
                echo '<td width="150px" class="auto-style3" >'.$myarticle.'</td><input type="hidden" name="iartikel" value="'.$myarticle.'" />';
                echo '<td width="80px" class="auto-style3" >'.$iwarna.'</td><input type="hidden" name="iwarna" value="'.$iwarna.'" />';    
                echo '<td width="80px" align="center" ><input type="text" name="qty" style="text-align: center;width:80px;" value="1" autofocus="true"></td>';
               // echo '<td width="100px" align="center" ><input type="text" name="cogs" style="text-align: center;width:100px;" value="'.$mysell.'" readonly/></td>';
                echo '<td width="50px" align="center" ><input type="text" name="disc1" style="text-align: center;width:20px;" /></td>';
                echo '<td width="50px"align="center" ><input type="text" name="disc2" style="text-align: center;width:20px;" /></td>';
                echo '<td width="50px" align="center" ><input type="text" name="disc3" style="text-align: center;width:20px;" /></td>';
               	echo '<td ><input type="submit"   name="addtolist" style="text-align: center;background-color:#1F618D;padding:12px 5px;" value="Add to cart"/></td>';
               	echo '</tr></form>';
                }
                 

              echo '</table>';
              $total=0;
              $stmt=null;
	
            	
    }           
?>

</body>
 <!--<div id="mybutton" ><img src="/img/logo/doremi.jpg" width="180px" height="86px"></div>!-->
</html>
<?php

}else { 
	echo 'Process cannot continue, please <a href="slogin.php">Login </a>';
}
?>
 