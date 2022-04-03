<?php

$query="SELECT i_barcode, i_name, CHAR_LENGTH(i_barcode) AS PANJANG FROM `winventory` WHERE CHAR_LENGTH(i_barcode)=14 AND RIGHT(i_barcode,1) IN ('0');";
$conn3=mysqli_connect('localhost','mimj5729_myroot','myroot@@##','mimj5729_anyar');
$showdetail= mysqli_query($conn3,$query) or die(mysql_error());
while ($row = mysqli_fetch_array($showdetail)){
    $barcode = $row['i_barcode'];
    $name = $row['i_name'];
    $panjang = $row['PANJANG'];
    $barcode1 = substr($barcode,0,13);

    // $queryupdate = "UPDATE winventory set i_barcode = '$barcode1' where i_barcode = '$barcode'";
    // $execqueryupdate= mysqli_query($conn3,$queryupdate) or die(mysql_error());
    echo $barcode.'              '.$barcode1.'               '.$name.'                   '.$panjang.'<br/>';
    
    
}


// $stringme="1234567890123A";
// echo "String is : ".$stringme;
// $mylen = strlen($stringme);
// echo 'mylen : '.$mylen;
// if ($mylen == 14){
//     echo 'here;';
//     $stringafter = substr($stringme,0,13);
// }
// echo "<br>After truncate : " . $stringafter;


?>