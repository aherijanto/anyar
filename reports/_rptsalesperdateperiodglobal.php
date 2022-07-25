<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");
session_start();
ob_start();
$upone = dirname(__DIR__, 1);
$_SESSION['reports']='1';
?>

<html>
<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td,
    th {
        border: 1px solid #dddddd;

        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }

    input[type=submit] {
        background-color: #0a9396;
        border: none;
        border-radius: 5px;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        margin: 4px 2px;
        cursor: pointer;
    }

    .me_date {
        padding: 5px 5px;

        color: black;
        font-size: 16px;
    }
</style>
<div align="center" style="background-color:#D35400;font-weight: bold;font-size: 30px;color:#F9E79F">SALES PER DATE PERIOD GLOBAL</div>
<div><br></div>
<div><br></div>
<div align="center" style="padding:15px;">SELECT DATE</div>
<form action="" method="post">
    <div align="center">
        From : &nbsp;&nbsp;<input type="date" class="me_date" name="mydate" id="mydate">&nbsp;&nbsp;
        To : &nbsp;&nbsp;<input type="date" class="me_date" name="mydate2" id="mydate2">
    </div>
    <div align="center" style="padding:20px;">
        Select Type : &nbsp;&nbsp;
        <select id="slcttype" name="slcttype" style="font-size:14px;width:200px;">
            <option value="0" selected>Select Type</option>
            <option value="Cash">Cash</option>
            <option value="A/R">A/R</option>
        </select>
    </div>
    <div align="center" style="padding:20px;">
        Select User : &nbsp;&nbsp;
        <?php
            include $upone."/class/_parkerconnection.php";
            
             try {
                 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                 $selectuser = "SELECT * FROM xloginuser";
                 $stmtuser = $pdo->prepare($selectuser);        
                 $stmtuser->execute();
                 $totaluser = $stmtuser->rowCount();
                 echo '<select id="slctuser" name="slctuser" style="font-size:14px;width:200px;">';
                 while ($rowuser=$stmtuser->fetchObject()) {
                     echo '<option value="'.$rowuser->cdtusername.'">'.$rowuser->cdtusername.'</option>';
                 }
                 echo '</select>';
             } catch (PDOException $e) {
                 echo $e->getMessage();
             }
             

        ?>
        </select>
    </div>
    <div align="center"><input type="submit" name="datesubmit" value="Process">
</form>

<?php

if (isset($_POST['datesubmit'])) {
    $mydate = $_POST['mydate'];
    $mydate1 = date('Y-m-d', strtotime($mydate));
    $mydate2 = date('Y-m-d', strtotime($_POST['mydate2']));
    $_SESSION['reports'] = '1';
    $mytype = $_POST['slcttype'];
    $ucode = $_SESSION['user'];
    $usercode = $_POST['slctuser'];
    
    include $upone . "/class/_parkerconnection.php";
    $usertype = $_SESSION['usertype'];
    // switch($usertype){
    //     case 'admin':
    //         $selectpcsGlob = "SELECT * FROM wsellhead WHERE s_date BETWEEN '$mydate1' AND '$mydate2' AND type = '$mytype'";
    //     case 'user':
    //         $selectpcsGlob = "SELECT * FROM wsellhead WHERE s_date BETWEEN '$mydate1' AND '$mydate2' AND type = '$mytype' AND u_code='$ucode'";
    // }

    try {
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        //$selectpcsGlob="SELECT * FROM `wbuyhead`,`wbuytail` WHERE wbuytail.b_code=wbuyhead.b_code";
        $selectpcsGlob = "SELECT * FROM wsellhead WHERE s_date BETWEEN '$mydate1' AND '$mydate2' AND type = '$mytype' AND u_code='$usercode'";
        $stmtpcsGlob = $pdo->prepare($selectpcsGlob);
        //$stmt->bindParam(':c_code', $mcode, PDO::PARAM_STR);

        $stmtpcsGlob->execute();
        $totalpcsGlob = $stmtpcsGlob->rowCount();
    } catch (PDOException $e) {
        echo $e->getMessage();
    }


    echo '<table width="100%">';
    echo '<th>DATE PERIOD</th><th>USER</th><th>TOTAL</th>';
    $grandtotal1 = 0;
    while ($rowpcsGlob = $stmtpcsGlob->fetchObject()) {
        //echo $row->c_code;
        $gcodeHead = $rowpcsGlob->s_code;
        $cname = $rowpcsGlob->c_code;
        $date1 = $rowpcsGlob->s_date;
        $duedate = $rowpcsGlob->s_dateinput;
        $bayar = $rowpcsGlob->s_premi;
        $kembali = $rowpcsGlob->s_deduct;
        $type = $rowpcsGlob->type;
        try {
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //$selectpcsGlob="SELECT * FROM `wbuyhead`,`wbuytail` WHERE wbuytail.b_code=wbuyhead.b_code";
            $selectpcsGlob1 = "SELECT * FROM `wselltail` WHERE s_code='$gcodeHead'";
            $stmtpcsGlob1 = $pdo->prepare($selectpcsGlob1);
            //$stmt->bindParam
            $stmtpcsGlob1->execute();
            $totalpcsGlob1 = $stmtpcsGlob1->rowCount();
        } catch (PDOException $e) {
            echo $e->getMessage();
        }

        $grandtotal = 0;
        $mysubtotal = 0;

        while ($rowpcsGlob1 = $stmtpcsGlob1->fetchObject()) {
            $i_qty = $rowpcsGlob1->i_qty;
            $i_price = $rowpcsGlob1->i_sell;
            $disc1 = $rowpcsGlob1->i_disc1;
            $disc2 = $rowpcsGlob1->i_disc2;
            $disc3 = $rowpcsGlob1->i_disc3;
            $mysubtotal = $i_qty * $i_price;

            $totaldisc1 = $mysubtotal * (1 - ($disc1 / 100));
            $totaldisc2 = $totaldisc1 * (1 - ($disc2 / 100));
            $totaldisc3 = $totaldisc2 - $disc3;

            $grandtotal = $grandtotal + $totaldisc3;
        } //
        // echo '<tr>';
        // echo '<td>' . $gcodeHead . '</td><td>' . $cname . '</td><td>' . date('d-m-Y', strtotime($date1)) . '</td><td>' . date('d-m-Y', strtotime($duedate)) . '</td><td>' . $type . '</td><td>' . $usercode . '</td><td align="center">' . number_format($bayar) . '</td><td align="center">' . number_format($kembali) . '</td><td align="right">' . number_format($grandtotal) . '</td>';
        $grandtotal1 = $grandtotal1 + $grandtotal;
    } //while*/
    echo '</tr>';
    echo '<tr>
            <td align="center" width="30%">' . date('d-M-Y',strtotime($mydate1)) . ' - '.date('d-M-Y',strtotime($mydate2)) . '</td>
            <td align="center" width="30%">' . $usercode . '</td>
            <td align="right" width="30%">' . number_format($grandtotal1) . '</td>
            </tr>';
    echo "</table>";
}
$_SESSION['reports'] = '0';
?>
<footer align="center">
    <?php
        include 'rptfooter.php';
    ?>
</footer>

</html>