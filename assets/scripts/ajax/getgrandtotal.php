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
            $subtotal = $item['qty'] * $item['cogs'];
            $subtotal = $subtotal*(1-($item['disc']/100));
            //$totaldisc2 = $totaldisc1*(1-($item['disc2']/100));
            $subtotal = $subtotal-$item['discrp'];
            $sumtotaldisc = $subtotal*($item['disc']/100)+$item['discrp'];
            $grandtotal=$grandtotal+$subtotal;
        }
        $arrgrand = array('grandtotal' => number_format($grandtotal));

        
    }
}else{
    $arrgrand = array('grandtotal'=>0);
    
}
echo json_encode($arrgrand);
?>