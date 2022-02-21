<?php
error_reporting(E_ALL);
ini_set("display_errors","On");
session_start();

if (isset($_SESSION['user'])!="" )
{
    include 'menuhtml.php';

    if (isset($_GET['c_code']))
    {
        $custcode=$_GET['c_code'];
        try
        {
            $pdo = new PDO('mysql:host=localhost;dbname=waletmas', 'root', 'root');

        }
        catch (PDOException $e)
        {
           echo 'Error: ' . $e->getMessage();
           exit();
        }

       try
       {
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "SELECT * FROM `wcustomers` WHERE c_code = $custcode";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':i_code', $custcode, PDO::PARAM_STR);
                $stmt->execute();
                $total = $stmt->rowCount();
                while ($row = $stmt->fetchObject()) {
                  $cID= $row->c_id;
                  $cName=$row->c_name;
                  $cGender=$row->c_gender;
                  $cPOB=$row->c_pob;
                  $cDOB=date('m/d/Y',strtotime($row->c_dob));
                  $cAddr=$row->c_addr;
                  $cRt=$row->c_rt;
                  $cKel=$row->c_kel;
                  $cKec=$row->c_kec;
                  $cPhone=$row->c_phone;
                  $cJoin=$row->c_join;

                }
        } catch(PDOException $e)
            {
                echo $e->getMessage();
            }

    }
    else
    {
        echo 'Process cannot continue, please select customer first...';
        exit();
    }

?>



<html>
<body>

    <script type="text/javascript">

                    function opencapture(){
                        window.open("cameraid.php", "_blank");
                    }
                </script>

<div>
<table align="center">
    <tr>
        <td align="center"><font color="grey" size="14">Edit Customer Profile</font></td>
    </tr>
</table>
</div>
<p>

<div>
<form method="post" action="">
<font style="font-zise:9px font-face:Arial ">
<table bgcolor="#4895F8" align="center" width="200" style="border-radius:10px; padding-left:10px; padding-right:10px; padding-top:5px; padding-bottom=5px;">
    <tr>
        <td colspan="2">Citizen No</td>
    </tr>
    <tr>
        <td colspan="2"><input type="text" name="c_id" style="width: 403px;" value="<?php echo $cID;?>" /></td>
    </tr>
    <tr>
        <td colspan="2">Fullname</td>
    </tr>
    <tr>
        <td colspan="2"><input type="text" name="fullname" style="width:403px;"value="<?php echo $cName;?>"/></td>
    </tr>
    <tr>
        <td colspan="2">Gender</td>
    </tr>
    <tr>
    <td colspan="2">
	<input type="text" name="c_gender" style="width:403px;" value="<?php echo $cGender;?>" placeholder="M for Male F for Female">
   </td></tr>
   <tr>
        <td>Place Of Birth</td>
        <td>Date Of Birth</td>
    </tr>
    <tr>
        <td><input type="text" name="pob" style="width:250px;" value="<?php echo $cPOB;?>"/></td>
        <td><input type="text" name="dob" style="width:150px;" value="<?php echo $cDOB;?>" placeholder="mm/dd/yyyy"/></td>
    </tr>
    <tr>
        <td>Address</td>
        <td>RT/RW</td>
    </tr>
    <tr>
        <td><input type="text" name="c_addr" style="width:250px;" value="<?php echo $cAddr;?>"/></td>
        <td><input type="text" name="c_rt" style="width:150px;" value="<?php echo $cRt;?>"/></td>
    </tr>
    <tr>
        <td>Kelurahan</td>
        <td>Kecamatan</td>
    </tr>

    <tr>
        <td><input type="text" name="c_kel" style="width:250px;" value="<?php echo $cKel;?>"/></td>
        <td><input type="text" name="c_kec" style="width:150px;" value="<?php echo $cKec;?>"/></td>
    </tr>
		<tr>
        <td>Phone</td>
        <td>Join Date</td>
    </tr>
    <tr>
        <td><input type="text" name="c_phone" style="width:250px;" value="<?php echo $cPhone;?>"/></td>
		<td><input type="text" name="c_date" style="width:150px;" value="<?php echo $cdate;?>" hidden /></td>
    </tr>
    <tr>
		<td><label><?php echo $custcode; ?></label> <img src="img/container/camera.png" alt="capture image" style="width:40px;height:40px;border:0;" onclick="opencapture()">
        </td>
        <td align="right"><br/><br/><input type="submit" name="update" value="Update Data" /></td>
    </tr>
</table>
</font>
</form>
</div>
</p>
</body>
</html>

<?php
if (isset($_POST['update']))
{
  $c_id=$_POST['c_id'];
  $fullname=$_POST['fullname'];
  $c_gender=$_POST['c_gender'];
  $pob=$_POST['pob'];
  $dob=date('Y-m-d',strtotime($_POST['dob']));
  $c_addr=$_POST['c_addr'];
  $c_rt=$_POST['c_rt'];
  $c_kel=$_POST['c_kel'];
  $c_kec=$_POST['c_kec'];
  $c_phone=$_POST['c_phone'];



  try
       {
         $pdo = new PDO('mysql:host=localhost;dbname=waletmas', 'root', 'root');

       }
       catch (PDOException $e)
       {
           echo 'Error: ' . $e->getMessage();
           exit();
       }

       try {
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "UPDATE `wcustomers` SET `c_code`='$custcode',`c_id`='$c_id',`c_name`='$fullname',`c_gender`='$c_gender',`c_pob`='$pob',`c_dob`='$dob',`c_addr`='$c_addr',`c_rt`='$c_rt',`c_kel`='$c_kel',`c_kec`='$c_kec',`c_phone`='$c_phone' WHERE `c_code`= $custcode";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':i_code', $custcode, PDO::PARAM_STR);
                $stmt->execute();
                $total = $stmt->rowCount();
?>
<script type="text/javascript">
window.location.href = 'searchengine1.php';
</script>
<?php
            } catch(PDOException $e) {
                echo $e->getMessage();
            }
        }

} else { echo 'Process cannot continue, please <a href="slogin.php">Login </a>';}
?>
