<?php
session_start();
if(isset($_SESSION['cart_item'])){
    if(!empty($_SESSION['cart_item'])){
		$table='<table class="table table-striped table-hover">';
		$table.='<thead>
			<tr>
				<th class="text-center" style="width:5%;">NO</th>
				<th class="text-center" style="width:5%;">ID</th>
				<th class="text-center" style="width:40%;">NAME</th>
				<th class="text-center" style="width:10%;">QTY</th>
				<th class="text-right" style="width:10%;">HARGA</th>
				<th class="text-right" style="width:10%;">DISC %</th>
				<th class="text-right" style="width:10%;">DISC Rp</th>
				<th class="text-right" style="width:10%;">TOTAL.DISC</th>
				<th class="text-right" style="width:30%;">SUBTOTAL</th>
			</tr>
		</thead>';
		$subtotal=0;
		$grandtotal=0;
		$no=0;
		foreach($_SESSION["cart_item"] as $item){
			$no++;
		$table.='<tbody>
				<tr>
					<td align="center">'.$no.'</td>
					<td align="center">'.$item["code"].'</td>
					<td align="left">'.$item['name'].'</td>
					<td align="center">'.$item['qty'].'</td>
					<td align="right">'.number_format($item['cogs']).'</td>
					<td align="right">'.number_format($item['disc'],2).'</td>
					<td align="right">'.number_format($item['discrp']).'</td>';
					
					$subtotal = $item['qty'] * $item['cogs'];
					$subtotal = $subtotal*(1-($item['disc']/100));
					//$totaldisc2 = $totaldisc1*(1-($item['disc2']/100));
					$subtotal = $subtotal-$item['discrp'];
					$sumtotaldisc = $subtotal*($item['disc']/100)+$item['discrp'];
		$table.='<td align="right">'.number_format($sumtotaldisc).'</td>
				<td align="right" style="font-weight:bold;font-size:18px;">'.number_format($subtotal).'</td>				
				<td class="text-center"><a hreff="'.$item["code"].'" class="link1 btn btn-danger">Remove</a></td></tr>';
		}
		$table.='</tbody>
				</table>';

		echo $table;
    }
}
?>