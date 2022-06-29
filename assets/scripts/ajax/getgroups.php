<?php
    error_reporting(E_ALL);
    ini_set("display_errors", "On");
    session_start();
    $upone = dirname(__DIR__);

    $gcode = $_POST['gcode'];
    $db='mimj5729_anyar';$user='mimj5729_myroot';$pwd='myroot@@##';
    try 
    {
	    $pdo = new PDO('mysql:host=localhost;dbname='.$db, $user, $pwd);
    }
        catch (PDOException $e) 
    {
        echo 'Error: ' . $e->getMessage();
        exit();
    }

    try {
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $selectpcsGlob = "SELECT * FROM winventory WHERE g_code = '$gcode'";
        $stmtpcsGlob = $pdo->prepare($selectpcsGlob);
        $stmtpcsGlob->execute();
        $totalpcsGlob = $stmtpcsGlob->rowCount();
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
    $grandtotal1 = 0;
    if($totalpcsGlob==0){
        echo 'NotFound';
    }else{
       $nourut=0;
        $mytable='<table width="100%">
                    <thead>
                        <th>NO</th>
                        <th>BARCODE</th>
                        <th>EDIT</th>
                        <th>PLU NAME</th>
                        <th align="center">QTY</th>
                        <th style="text-align:right;">COGS</th>
                        <th style="text-align:right;">SELL</th>
                        <th style="text-align:right;">SELL 3</th>
                        <th style="text-align:right;">SELL 6</th>
                        <th style="text-align:right;">SELL GROCIER</th>
                    </thead>';
        
    while ($rowpcsGlob = $stmtpcsGlob->fetchObject()) {
        //echo $row->c_code;
        $nourut++;
        $barcode = $rowpcsGlob->i_barcode;
        $iname = $rowpcsGlob->i_name;
        $iqty = $rowpcsGlob->i_qty;
        $icogs = $rowpcsGlob->i_cogs;
        $isell = $rowpcsGlob->i_sell;
        $isellthree = $rowpcsGlob->i_sell2;
        $isellsix = $rowpcsGlob->i_sell3;
        $isellgrocir = $rowpcsGlob->i_sell4;
        $mytable.= '<tr style="color:#023047;">';
        $mytable.= '<td>'.$nourut.'</td><td>'.$barcode.'</td><td><input type="text" name="barcode" id="'.$barcode.'" value="'.$barcode.'"></td><td>' . $iname . '</td><td align="center"><input type="text" style="width:100px;text-align:right;" name="iqty[]" id="iqty" value="'.$iqty.'"></td><td align="right"><input type="text" style="width:100px;text-align:right;" name="icogs[]" id="icogs" value="'.$icogs.'"></td><td align="right"><input type="text" style="width:100px;text-align:right;" name="isell1[]" id="isell1" value="'.$isell.'"></td><td align="right"><input type="text" style="width:100px;text-align:right;" name="isell3[]" id="isell3" value="'.$isellthree.'"></td><td align="right"><input type="text" style="width:100px;text-align:right;" name="isell6[]" id="isell6" value="'.$isellsix.'"></td><td align="right"><input type="text" style="width:100px;text-align:right;" name="isellG[]" id="isellG" value="'.$isellgrocir.'"></td>';
        $mytable.= '</tr>';       
       
    } //while*/
    $mytable.= '</table>';
    echo $mytable;
}
//$_SESSION['reports'] = '0';
?>
