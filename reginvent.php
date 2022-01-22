<?php
error_reporting(E_ALL);
ini_set("display_errors","On");
session_start();
ob_start();
$_SESSION['reports']='0';

if (isset($_SESSION['user'])!="" ){
include 'class/_parkerinvent.php';


$mygroup1=0;
$sequence='';
if (isset($_POST['saveinvent'])){

		$i_code=$_POST['icode'];
		$g_code=$_SESSION['gcode'];
    $i_supp=$_POST['isupp'];
    $i_barcode=$_POST['ibarcode'];
		$i_name=$_POST['iname'];
		$i_qty=$_POST['iqty'];
    $i_qtymin=$_POST['iqtymin'];
    $i_unit=$_POST['iunit'];
    $i_ukuran=$_POST['iukuran'];
    $i_warna=$_POST['iwarna'];
    $i_merk=$_POST['imerk'];
    $i_artikel=$_POST['iartikel'];
		$i_cogs=$_POST['icogs'];
    $i_kdsell=$_POST['ikdsell'];
    $i_sell=$_POST['isell'];
		$i_status=$_POST['istatus'];
	

		if ($i_code == '') {
				echo 'Something wrong with input ID, process cannot continue..';
				exit;
		}
		$myinvent=new Inventory($i_code,$g_code,$i_supp,$i_barcode,$i_name,$i_qty,$i_qtymin,$i_unit,$i_ukuran,$i_warna,$i_merk,$i_artikel,$i_cogs,$i_kdsell,$i_sell,$i_status);
		//$mycustomer->set_c_code($c_code);
		$myinvent->save_inventory();
}


function setbarcode(){
  $first=date('Ymd');
  $two=rand(10000,19999);
  $barcode=$first.$two;
  return $barcode;
}

function writeCodeItem($group){
  $populateGrp="SELECT * FROM winventory WHERE  g_code='$group' ORDER BY id DESC LIMIT 1";
  include 'class/_parkerconnection.php';
          
          try {
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $stmt = $pdo->prepare($populateGrp);
                //$stmt->bindParam(':c_code', $mcode, PDO::PARAM_STR);
                $stmt->execute();
                $total = $stmt->rowCount();
                /*while ($row = $stmt->fetchObject()) {
                  echo $row->c_code;
                }*/
            } catch(PDOException $e) {
                echo $e->getMessage();
            }
            $rowSeq = $stmt->fetch();

    if ($total=0){
      $sequence='00001';
      //return $sequence;
      //exit();
    }else{
      $icodeS=$rowSeq['i_code'];
      $getNumber=intval((substr($icodeS, -5)));
      
    switch (strlen(strval($getNumber))){
      case 1:
        $sequence='0000';
        break;
      case 2:
        $sequence='000';
        break;
      case 3:
        $sequence='00';
        break;
    case 4:
      $sequence='0';
      break;
    case 5:
      
      break;
  }
  }
  
  $getNumberConvert=(int)$getNumber+1;
  $combine=$sequence.strval($getNumberConvert);
  if (strlen($combine)==6){
    $sequence1=substr($combine,-5);
  }else{
    $sequence1=$sequence.strval($getNumberConvert);
  }
  return $sequence1;
}
?>



<html>
<?php include 'menuhtml.php';?>
<link rel="icon" href=".\img\logo\cappa_icon.jpg">
<head>
  <link rel = "stylesheet" type = "text/css" href = "css/raw_css.css" />
  <link rel = "stylesheet" type = "text/css" href = "css/editinvent.css" />
  <style>
   @font-face {
                font-family: code39;
                src: url(barcode/Code39Azalea.ttf);
</style>
</head>

<script type="text/javascript">
function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              $('#blah')
                  .attr('src', e.target.result)
                  .width(150)
                  .height(200);
          };

          reader.readAsDataURL(input.files[0]);
      }
  }

function getFullName(){
  document.getElementById("iname").value=document.getElementById("imerk").value+' '+document.getElementById("iartikel").value+' '+document.getElementById("iwarna").value+' '+document.getElementById("iukuran").value;

}

function writeCode(){
  var y = document.getElementById("gcode");
  document.cookie="mygroup=" + y.value;
  alert(y.value);
}
  </script>



<body>

<div>
<table align="center">
    <tr>
        <td align="center"><font color="#85C1E9" size="14">Create Your Inventory Account</font></td>
    </tr>
</table>
</div>

<p>

<div class="flex-container">
  <div>
    <form method="post" action="">
    
    <table bgcolor="" align="center" width="100" style="border-radius:10px; padding-left:10px; padding-right:10px; padding-top:5px; padding-bottom=5px;">
    
    <tr>
        <td colspan="3">GROUP BARANG</td>
    </tr>

    <tr>
        <td>
          <?php
             
        include 'class/_parkerconnection.php';

          $mygroup=1;
          try {
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "SELECT * FROM wgroups ORDER BY g_code ASC";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':c_code', $mcode, PDO::PARAM_STR);
                $stmt->execute();
                $total = $stmt->rowCount();
                /*while ($row = $stmt->fetchObject()) {
                  echo $row->c_code;
                }*/
            } catch(PDOException $e) {
                echo $e->getMessage();
            }

            echo '<form method="POST"><select name="gcode" id="gcode" onchange="this.form.submit();">
                  <option value="" disabled selected>Select Group Here</option>';
            while ($row = $stmt->fetchObject()) {
              //echo $row->c_code;
              
              echo '<option value="'.$row->g_code.'">'. $row->g_code.' - '.$row->g_name. '</option>';

           }
           echo '</select></form>';

           if (isset($_POST['gcode'])){
            $_SESSION['gcode']=$_POST['gcode'];
            $numberSeq=writeCodeItem($_POST['gcode']);
            $mygroup1=$_POST['gcode'].$numberSeq;
          }

         ?>
          </td>
          <td><?php 
                if (isset($_SESSION['gcode'])){
                  echo $_SESSION['gcode'];
                } 
              ?> 
          </td>
    </tr>

    <tr>
        <td>KODE BARANG</td>
        <td>SUPPLIER</td>
        <td></td>
    </tr>

    <tr>
      <td><input type="text" name="icode" id="icode" value="<?php echo $mygroup1;?>" readonly></td>
        
      <td>


        <?php
         include 'class/_parkerconnection.php';

          try {
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "SELECT * FROM wsuppliers ORDER BY s_name ASC";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':c_code', $mcode, PDO::PARAM_STR);
                $stmt->execute();
                $total = $stmt->rowCount();
                /*while ($row = $stmt->fetchObject()) {
                  echo $row->c_code;
                }*/
            } catch(PDOException $e) {
                echo $e->getMessage();
            }

            echo '<select name="isupp">
                  <option value="" disabled selected>Select Supplier Here</option>';
            while ($row = $stmt->fetchObject()) {
              //echo $row->c_code;
              
              echo '<option value="'.$row->s_code.'">'. $row->s_name. '</option>';

           }
           echo '</select>';
        ?>
      </td>
      <td></td>
    </tr>
    <tr>

        <td colspan="2">BARCODE</td>
    </tr>

    <tr>
        <td colspan="2">
        <input type="text" name="ibarcode" style="width:350px;"/>
        </td>
    </tr>

		<tr>
        <td>MERK</td>
        <td>ARTIKEL</td>
        
    </tr>

    <tr>
        
        <td >
          <input type="text" name="imerk"  id="imerk" placeholder="Ketik Merk ..." oninput="getFullName();" />
        </td>
        <td>
          <input type="text" name="iartikel" id="iartikel" placeholder="Detail Barang ..." oninput="getFullName();" />
        </td>
    </tr>

    <tr>
      <td> WARNA</td>
      <td> SIZE </td>
    </tr>

    <tr>
        <td >
          <input type="text" name="iwarna"  id="iwarna" placeholder="Ketik Warna ..." oninput="getFullName();"/>
        </td>
        <td >
          <input type="text" name="iukuran"  id="iukuran" placeholder="S,M,L,XL,XXL" oninput="getFullName();" />
        </td>
    </tr>

    <tr>
        <td colspan="2">NAMA BARANG</td>
    </tr>

    <tr>
        <td colspan="2"><input type="text" name="iname" id="iname" placeholder="Type name here..." style="width: 350px;"/></td>
    </tr>

		<tr>
        <td>SATUAN</td>
        <td>REORDER.QTY</td>
    </tr>

    <tr>
      <td>
          <input type="text" name="iunit"  placeholder="Type Unit..." />
        </td>

      <td>
          <input type="text" name="iqtymin" value="1" placeholder="Type number here..." />
        </td>
        
    </tr>

    <tr>
      <td>QTY</td>
    </tr>
    <tr>
        <td >
          <input type="text" name="iqty" value="0" placeholder="Type number here..." readonly />
        </td>
    </tr>


		<tr>
        <td>HPP</td>
        <td>KODE HARGA
    </tr>

    <tr>
        <td><input type="text" name="icogs" placeholder="Type number here..." />
        </td>
        <td><input type="text" name="ikdsell" placeholder="Type here..." />
    </tr>


    <tr>
        <td colspan="2">HARGA JUAL</td>
    </tr>

    <tr>
        <td colspan="2"><input type="text" name="isell" placeholder="Type number here..."/></td>
    </tr>


		<tr>
        <td colspan="2">Status</td>
    </tr>

    <tr>
        <td colspan="2"><input type="text" value="A" name="istatus" placeholder="Type here..." /></td>
    </tr>

		

    <tr>
        <td colspan="2" align="right">
          <input type="submit" name="saveinvent" value="Save Data" />
        </td>
    </tr>

</table>

</form>
</div>

<div>
    <form action="" method="post">
        <input type="text" name="searchname" width="300px style="padding:5px;height:10px;">
        <input type="submit" name="sub_search" value="Search Name" style="padding:8px 8px;border-radius:5px;width:120px;background-color:007f5f;height:40px;">
    </form>
</div>

<div class="list-flex">
<?php
include 'class/_parkerconnection.php';

if(isset($_POST['sub_search'])){
    $item_name = $_POST['searchname'];
    if ($item_name == ''){
        try {
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $sql = "SELECT * FROM winventory ORDER BY id DESC LIMIT 50;";
            $stmt = $pdo->prepare($sql);
          
            $stmt->execute();
            $total = $stmt->rowCount();
            
        } catch(PDOException $e) {
            echo $e->getMessage();
        }
    }else{
        try {
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $sql = "SELECT * FROM winventory WHERE i_name LIKE '$item_name%' ORDER BY i_name";
            $stmt = $pdo->prepare($sql);
       
            $stmt->execute();
            $total = $stmt->rowCount();
       
        } catch(PDOException $e) {
            echo $e->getMessage();
        }
    }
}else {
           

          $mysort='i_code';
          try {
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "SELECT * FROM winventory ORDER BY id DESC LIMIT 50;";
                $stmt = $pdo->prepare($sql);
              
                $stmt->execute();
                $total = $stmt->rowCount();
                
            } catch(PDOException $e) {
                echo $e->getMessage();
            }
        }// else $_POST['sub_search']
           
            $row_invent=array();

            while ($row3 = $stmt->fetchObject()) {
                $row_invent[]=$row3;
            }
            $row_encode=json_encode($row_invent);

            $data = json_decode($row_encode);
            /* Since it's only one object inside the array, you could just select element zero, but I wil loop*/

            //You should now be able to do this
            foreach ($data as $current){ 
                echo '<div><form action="editinvent1.php?codeinvent='.$current->i_code.'" method="post">
                <div class="cards-item">
                    <input type="hidden" name="i_code" value="'.$current->i_code.'">
                    <div class="card-texttitle" >'.$current->i_name.'<br/>'.$current->i_code.'</div>
                    
                    <div class="card-text"></br>Available</div>
                    <div class="card-text">'.$current->i_qty.' '.$current->i_unit.'</div>
                    <div class="card-text" style="margin-top:5px">'.$current->i_size.' '.$current->i_color.' '.$current->i_brands.'</div>
                    
                    <div class="card-text" style="margin-top:5px">'.$current->i_article.'</div>
                    
                    <div class="card-footer"><input type="submit" name="edit" value="Edit"
                    style="background-color:#0080ff;margin-top:1px;padding:5px 5px;height:30px;"/></div>
                  </div></form></div>';

            }

?>
</div>
</div>
</body>
</html>
<?php
}else { echo 'Process cannot continue, please <a href="slogin.php">Login </a>';}
?>
