<?php
$query="SELECT BARCODE, KODE, NAMA, CHAR_LENGTH(BARCODE) AS PANJANG FROM `persediaan` WHERE CHAR_LENGTH(BARCODE)=14 AND RIGHT(BARCODE,1) IN ('0');";
$conn3=mysqli_connect('localhost','mimj5729_myroot','myroot@@##','new_susi');
$showdetail= mysqli_query($conn3,$query) or die(mysql_error());
while ($row = mysqli_fetch_array($showdetail)){
    $barcode = $row['BARCODE'];
    $koed = $row['KODE'];
    $name = $row['NAMA'];
    $panjang = $row['PANJANG'];
    $barcode1 = substr($barcode,0,13);

    $queryupdate = "UPDATE persediaan set BARCODE = '$barcode1' where BARCODE = '$barcode'";
    $execqueryupdate= mysqli_query($conn3,$queryupdate) or die(mysql_error());
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