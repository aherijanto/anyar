<?php
session_start();
$subtotal=0;
$grandtotal=0;
$arrgrand = array('grandtotal'=>0);
$no=0;
if(isset($_SESSION['cart_item'])){
    if(!empty($_SESSION['cart_item'])){
        
        foreach($_SESSION["cart_item"] as $item){
            $no++;    
            $subtotal=0;
	        $discperitem=0;
			$diskpercentperitem=0;
			

            $discperitem = $item['cogs'] - $item['discrp'];
			$subtotal = $item['qty'] * ($item['cogs']-$discrp);
			$sumtotaldisc = $item['qty'] * $discrp;
            
							
            $grandtotal=$grandtotal+$subtotal;
        }
        $arrgrand = array('grandtotal' => number_format($grandtotal));

        
    }
}else{
    $arrgrand = array('grandtotal'=>0);
    
}
echo json_encode($arrgrand);
?>