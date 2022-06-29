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
<div align="center" style="background-color:#8338ec;font-weight: bold;font;font-size: 30px;color:#F9E79F">PURCHASING PER DATE PERIOD DETAIL</div>
<div><br></div>
<div><br></div>
<div align="center" style="padding:15px;">SELECT DATE</div>
<form action="" method="post">
    <div align="center">
        From : &nbsp;&nbsp;<input type="date" class="me_date" name="mydate" id="mydate">&nbsp;&nbsp;
        To : &nbsp;&nbsp;<input type="date" class="me_date" name="mydate2" id="mydate2">
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
    
    $ucode = $_SESSION['user'];
    $usercode = $_POST['slctuser'];
    include $upone . "/class/_parkerconnection.php";
    $usertype = $_SESSION['usertype'];
    
    try {
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        //$selectpcsGlob="SELECT * FROM `wbuyhead`,`wbuytail` WHERE wbuytail.b_code=wbuyhead.b_code";
        $selectpcsGlob = "SELECT * FROM wbuyhead WHERE b_date BETWEEN '$mydate1' AND '$mydate2' AND u_code='$usercode'";
        $stmtpcsGlob = $pdo->prepare($selectpcsGlob);
        //$stmt->bindParam(':c_code', $mcode, PDO::PARAM_STR);

        $stmtpcsGlob->execute();
        $totalpcsGlob = $stmtpcsGlob->rowCount();
    } catch (PDOException $e) {
        echo $e->getMessage();
    }


    echo '<table width="100%">';
    echo '<th>NO FAKTUR</th><th>SUPPLIER</th><th>TGL NOTA</th><th>JTH.TEMPO</th><th>USER</th>';
    echo '</table>';
    $grandtotal1 = 0;
    while ($rowpcsGlob = $stmtpcsGlob->fetchObject()) {
        //echo $row->c_code;
        $gcodeHead = $rowpcsGlob->b_code;
        $cname = $rowpcsGlob->s_code;
        $date1 = $rowpcsGlob->b_date;
        $duedate = $rowpcsGlob->b_dateinput;
        $refno = $rowpcsGlob->b_refno;
        try {
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //$selectpcsGlob="SELECT * FROM `wbuyhead`,`wbuytail` WHERE wbuytail.b_code=wbuyhead.b_code";
            $selectpcsGlob1 = "SELECT * FROM `wbuytail` WHERE b_code='$gcodeHead'";
            $stmtpcsGlob1 = $pdo->prepare($selectpcsGlob1);
            //$stmt->bindParam
            $stmtpcsGlob1->execute();
            $totalpcsGlob1 = $stmtpcsGlob1->rowCount();
        } catch (PDOException $e) {
            echo $e->getMessage();
        }

        $grandtotal = 0;
        $mysubtotal = 0;

        echo '<table width="100%"> <tr>';
        echo '<td width="20%">' . $gcodeHead .' / '.$refno. '</td><td width="30%">' .  $cname . '</td><td width="20%">' . date('d-m-Y', strtotime($date1)) . '</td><td width="20%">' . date('d-m-Y', strtotime($duedate)) . '</td><td width="20%">' . $usercode . '</td>';
        echo '</tr></table>';

        echo '<table width="100%" class="mf">';
        while ($rowpcsGlob1 = $stmtpcsGlob1->fetchObject()) {
            $i_qty = $rowpcsGlob1->i_qty;
            $i_price = $rowpcsGlob1->i_cogs;
            $disc1 = $rowpcsGlob1->i_disc1;
            $disc2 = $rowpcsGlob1->i_disc2;
            $disc3 = $rowpcsGlob1->i_disc2;
            $mysubtotal = $i_qty * $i_price;

            $totaldisc1 = $mysubtotal * (1 - ($disc1 / 100));
            $totaldisc2 = $totaldisc1 * (1 - ($disc2 / 100));
            $totaldisc3 = $totaldisc2 * (1 - ($disc3 / 100));

            $grandtotal = $grandtotal + $totaldisc3;
            echo '<tr style="font-size:12px;color:#023047;">';
            echo '<td style="padding-left:20px;" width="15%">' . $rowpcsGlob1->i_name . '</td><td width="15%" align="center">' . $i_qty . '</td><td width="15%" align="right">' . number_format($i_price) . '</td><td width="15%" align="right">' . number_format($disc1, 3) . '</td><td width="15%" align="right">' . number_format($rowpcsGlob1->i_disc3) . '</td><td width="15%" align="right">' . number_format($grandtotal) . '</td>';
            echo '</tr>';
            $grandtotal1 = $grandtotal1 + $grandtotal;
            $grandtotal = 0;
        } //
        echo '</table>';
    } //while*/
    echo '<table width="100%">';
    echo '<tr><td align="right" colspan="6">' . number_format($grandtotal1) . '</td></tr>';
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