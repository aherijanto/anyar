<?php
$query="SELECT i_barcode, i_cogs, i_sell, i_sell2, i_sell3, i_sell4, i_sell5 FROM `winventory`;";
$conn3=mysqli_connect('localhost','mimj5729_myroot','myroot@@##','mimj5729_anyar');
$showdetail= mysqli_query($conn3,$query) or die(mysql_error());
while ($row = mysqli_fetch_array($showdetail)){
    $barcode = $row['i_barcode'];
    $i_sell = $row['i_sell'];
    $i_sell2 = $row['i_sell2'];
    $i_sell3 = $row['i_sell3'];
    $i_sell4 = $row['i_sell4'];
    $i_sell5 = $row['i_sell5'];
    

    $cogs = $i_sell;
    $sell = $i_sell2;
    $sell2 = $i_sell3;
    $sell3 = $i_sell4;
    $sell4 = $i_sell5;
    $sell5 = 0;

    $queryupdatesell = "UPDATE winventory set i_cogs = '$cogs', i_sell = '$sell', i_sell2 = '$sell2', i_sell3 = '$sell4', i_sell4 = '$sell4', i_sell5 = '$sell5' where i_barcode = '$barcode'";
    $execqueryupdatesell = mysqli_query($conn3,$queryupdatesell) or die(mysql_error());
    //echo $barcode.'              '.$barcode1.'               '.$name.'                   '.$panjang.'<br/>';
}
?>