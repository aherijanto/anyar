<?php
session_start();
if(isset($_SESSION['cart_item'])){
    if(!empty($_SESSION['cart_item'])){
		
		$subtotal=0;
		$grandtotal=0;
		$no=0;
        $table='<table >';
        $table.='<tbody>';
		foreach($_SESSION["cart_item"] as $item){
			$no++;

            // $discperitem = $item['cogs'] - $item['discrp'];				
			// $subtotal = $item['qty'] * $discperitem;
			// $sumtotaldisc = $item['qty'] * $item['discrp'];
			$subtotal=0;
	        $discperitem=0;
			$diskpercentperitem=0;
			if($item['disc']==0){
				$discpercent=($item['discrp']/$item['cogs'])*100;
				$discrp=$item['discrp'];
			}
			if($item['discrp']==0){
				$discrp=($item['disc']*$item['cogs'])/100;
				$discpercent = $item['disc'];
			}

            $discperitem = $item['cogs'] - $item['discrp'];
			$subtotal = $item['qty'] * ($item['cogs']-$discrp);
			$sumtotaldisc = $item['qty'] * $discrp;
            $grandtotal=$grandtotal+$subtotal;
		    $table.='
				<tr>
					<td colspan="3">'.$item["name"].'</td>
                </tr>
                <tr>
					<td align="left width="15px;">'.$item['qty'].' *</td>
					<td align="right" width="50px;">'.number_format($item['cogs']).'</td>
                    <td align="right" width="150px;">'.number_format($subtotal).'</td>
                </tr>';
            
            $table.='<tr>
				<td colspan="3" style="padding-bottom:10px;">Hemat : '.number_format($sumtotaldisc).'</td>
				</tr>';	
					
		}
        $table.='<tr><td colspan="3"><hr></td></tr>
                <tr>
                <td colspan="3" align="right" style="padding:10px 5px;font-size:18px;font-weight:bold;">Total : '.number_format($grandtotal).'</td>
                </tr>';	
		$table.='</tbody>
				</table>';

		echo $table;
    }else{
		echo 'Data Not Found';
	}
}
?>