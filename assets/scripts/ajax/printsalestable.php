<html>
<head>
<meta content="en-us" http-equiv="Content-Language">
<style type="text/css">
	.auto-style1 {
		font-family: Calibri;
	font-size: small;

}

.title{
	font-family: Baloo Chettan;
	font-size: 2rem;
	font-weight: bold;

}

.headerbtm{
	font-family: Arial;
	font-size:12px;

}


}
</style>
</head>

<?php
session_start();

$_SESSION['reports']='0';
$myinvno1=$_GET['noinv'];

$userInv=$_SESSION['user'];

$payme=0;
$changeme=0;

$conn3=mysqli_connect('localhost','mimj5729_myroot','myroot@@##','mimj5729_matahari');
$sqlcompany="SELECT * FROM wcompany;";
$showcompany= mysqli_query($conn3,$sqlcompany) or die(mysql_error());
$rowcompany = mysqli_fetch_array($showcompany);
$name = $rowcompany['name'];
$addr1 = $rowcompany['address1'];
$addr2 = $rowcompany['address2'];
$city = $rowcompany['city'];
$phone = $rowcompany['phone'];
//mysqli_select_db('inventory');

echo '<table width="100%">';
echo '<tr><td colspan="2" class="headerbtm" align="center" >'.$name.'</td></tr>';
echo '<tr><td colspan="2" class="headerbtm" align="center" >'.$addr1.'</td></tr>';
echo '<tr><td colspan="2" align="center" class="headerbtm">'.$addr2.'</td></tr>';
echo '<tr><td colspan="2" align="center" class="headerbtm">'.$city.'</td></tr>';
echo '<tr><td colspan="2" align="center" class="headerbtm">'.$phone.'</td></tr>';
//echo '<tr><td colspan="2" class="headerbtm" align="center">'.$myinvno1.'</td></tr>';
echo '<tr><td class="headerbtm" align="left">'.date('d-m-Y').'</td>';
date_default_timezone_set("Asia/Jakarta");
$mytime=date("h:i:sa");


echo '<tr><td colspan="2"><hr/></td></tr>';
echo '</table>';
$sqlinv="SELECT * FROM wsellhead,wselltail where wselltail.s_code='$myinvno1' and wsellhead.s_code=wselltail.s_code";
$showdetail= mysqli_query($conn3,$sqlinv) or die(mysql_error());
$item_total=0;
$payme=0;
$changeme=0;

$itemcount=0;
$totaldisc1=0;
$totaldisc2=0;
$totaldisc3=0;
$grandtotal=0;
echo '<table width="100%">';
while ($row =mysqli_fetch_array($showdetail))
{
	$subtotal=0;
	$mykdbrg=$row['i_code'];
	$disc1=$row['i_disc1'];
	$disc2=$row['i_disc2'];
	$disc3=$row['i_disc3'];

	$sqlsatuan="SELECT * from winventory,wwarehouse where i_code='$mykdbrg' and winventory.ware_id=wwarehouse.ware_id;";
	
	$showsatuan= mysqli_query($conn3,$sqlsatuan) or die(mysql_error());
	if ($row1 =mysqli_fetch_array($showsatuan))
	{ 
		$myitemcode=$row1['i_unit'];
		$mywareid=$row1['ware_id'];
		$mywarename=$row1['ware_name'];
		
	}	

	$mysub=$row['i_qty']*$row['i_sell'];
	echo '<tr><td colspan="2" class="headerbtm">'.$row['i_name'].' - '.$mywarename.'</td></tr>';
	
	$discperitem = $row['i_sell'] - $row['i_disc3'];
	$subtotal = $row['i_qty'] * $discperitem;						
	$sumtotaldisc = $row['i_qty'] * $row['i_disc3'];
    $grandtotal=$grandtotal+$subtotal;
	
	echo '<tr>
			<td align="left" class="headerbtm">'.$row['i_qty'].' '.$myitemcode.' x '.number_format($row['i_sell']).'</td></tr>
			<tr><td class="headerbtm" style="padding-bottom:5px;">Hemat: '.number_format($sumtotaldisc).'</td>
			<td align="right" class="headerbtm">'.number_format($subtotal).'</td></tr>';

	$payme=$row['s_premi'];
	$changeme=$row['s_deduct'];
	$item_total+=$totaldisc3;
	$itemcount=$itemcount+1;
}
echo '<tr><td colspan="2" class="headerbtm"><hr/></td></tr>';
//echo '</table>';
//echo '<table width="100%">';
echo '<tr><td align="left" class="headerbtm">TOTAL :</td><td align="right" class="headerbtm">'.number_format($grandtotal).'</td></tr>';

echo '<tr><td class="headerbtm">BAYAR :</td><td align="right" class="headerbtm">'.number_format($payme).'</td></tr>';
echo '<tr><td class="headerbtm">KEMBALI :</td><td align="right" class="headerbtm">'.number_format($changeme).'</td></tr>';
echo '<tr><td class="headerbtm">'.$itemcount.' Item(s)</td></tr>';
echo '<td class="headerbtm" align="left">'.$mytime.' / '.$userInv.' / '.$myinvno1.'</td></tr>';
echo '<tr><td colspan="2" class="headerbtm" align="center"><a href="/salesdirect.php" style="text-decoration:none;color:#000000;">TERIMA KASIH ATAS KUNJUNGAN ANDA</a></td></tr>'; 
echo '</table>';
$_SESSION['cust']='';
$_SESSION['pay']=0;
$_SESSION['change']=0;
unset($_SESSION['bayar']);
unset($_SESSION['kembali']);
?>
</html>

