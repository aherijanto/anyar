<?php
	session_start();
	date_default_timezone_set("Asia/Jakarta");

	/*require_once('../../requires/config.php');
	require_once('../../requires/fungsi.php');*/

	if($_POST["id"]) {

		$kdbrg = $_POST["id"];

			$conn2 = mysqli_connect('localhost','mimj5729_myroot','myroot@@##','mimj5729_senang');
			$result = mysqli_query($conn2,"select KD_BRG,BARCODE,NM_BRG,HPP,HRG_JUALB from mstbrg where KD_BRG = $kdbrg;");
			if(!$result){
				die();
				echo 'noresult';
			}else{
				$jumrec=mysqli_num_rows($result);
			}
			

			if($jumrec>0){
				$record = mysqli_fetch_array($result);
				$arr = array('id' => $record["KD_BRG"],
							 'nm' => $record["NM_BRG"],
							 'hpp' => $record["HPP"],
							 'hrgjual' => $record["HRG_JUALB"]
							 );
			}
			else{
				$arr = array('id' => '0',
							 'nm' => '',
							 'hpp' => '',
							 'hrgjual' => ''
							 );
			}

			echo json_encode( $arr );


	}
?>
