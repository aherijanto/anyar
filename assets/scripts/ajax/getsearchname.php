<?php
	session_start();
	date_default_timezone_set("Asia/Jakarta");
	error_reporting(E_ALL);
    ini_set("display_errors","On");

    if($_POST["name"]){

		$name=$_POST["name"];
		$conn2 = mysqli_connect('localhost','mimj5729_myroot','myroot@@##','mimj5729_matahari');

			$result = mysqli_query($conn2,"select * from winventory where i_name like '%$name%';");
            $jumrec = mysqli_num_rows($result);

			if($jumrec > 0){
                $table='<table class="table table-striped table-hover" >';
			    $table.='<thead>
							<tr>
								<th class="text-center" >CODE</th>
                                <th class="text-center" >BARCODE</th>
                                <th class="text-center" >NAME</th>
                                <th class="text-center" >QTY</th>
							</tr>
						 </thead>
                         <tbody>';			
                while($record = mysqli_fetch_array($result)){
                    $table.='<tr>
                    <td><a href="#" hreff="'.$record["i_code"].'" class="linkk">'.$record["i_code"].'</a>
                    <td class="text-center">'.$record["i_barcode"].'</td>					
                    <td class="text-center"><a hreff="'.$record["i_name"].'" id="iname">'.$record["i_name"].'</a></td>
                    <td class="text-center"><a hreff="'.$record["i_code"].'" class="linkk2 btn btn-primary">Pilih Harga</a></td>';
                }

                $table.='</tbody>
					 	</table>';
             }
			else{
				$table = 'Data Not Found';
                //echo 'Data Error';
				//$arr = array('barcode' => '0',
				//			 'namabarang' => '',
				//			 'hpp' => '',
				//			 'hrgjual' => '');
			}

			echo $table;
        }

?>
