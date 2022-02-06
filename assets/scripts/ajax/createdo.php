<?php
    session_start();
    $wareid=$_GET['wareid'];
    $noinv=$_GET['noinv'];
    $conn=mysqli_connect('localhost','mimj5729_myroot','myroot@@##','mimj5729_matahari');
    $warehousequery = "select * from wwarehouse where ware_id='$wareid'";
    $showwarehouse = mysqli_query($conn,$warehousequery);
    $rowware = mysqli_fetch_array($showwarehouse);

    $companyquery = "select * from wcompany";
    $showcompany = mysqli_query($conn,$companyquery);
    $rowcompany = mysqli_fetch_array($showcompany);
    $coname = $rowcompany['name'];

    $warename=$rowware['ware_name'];
    echo '<head><title>'.$wareid.'@'.$noinv.'</title></head>';
    echo '<div style="font-size:22px;font-weight:bold;">'.$warename.'</div><br>';
    echo '<div style="font-size:14px;">'.$coname.'</div><br>';
    echo '<div style="font-size:16px;font-weight:normal;">Invoice No: '.$noinv.'</div><br/>';
    echo '<div style="font-size:16px;font-weight:normal;">Print Date: '.date('d-m-Y').'</div>';
    echo '<div style="font-size:16px;font-weight:normal;">Print Time: '.date('H:i:s').'</div>';

    if (isset($_SESSION[$wareid])){
        $no=0;
        echo '<table style="width:100%;border-collapse:collapse;">
                <thead style="border:solid;"> 
                    <th class="text-center" style="width:5%;">NO</th>
                    <th class="text-left" style="width:5%;">CODE</th>
                    <th class="text-left" style="width:40%;">ITEM NAME</th>
                    <th class="text-right" style="width:20%;">QTY</th>
                    <th class="text-center" style="width:10%;">UNIT</th>
                    
                </thead>
               
                <tbody>';
        foreach($_SESSION[$wareid] as $item){
            $no++;
            echo '<tr styles="padding:10px 10px;">
                    <td style="text-align:center;">'.$no.'</td>
                    <td style="text-align:left;">'.$item['code'].'</td>
                    <td style="text-align:left;padding:10px 40px;">'.$item['name'].'</td>
                    <td style="text-align:center;">'.$item['qty'].'</td>
                    <td style="text-align:center;">'.$item['unit'].'</td>
                  </tr>';
        }
        echo '<tbody></table>';
        echo '<div style="margin-top:200px;"><hr></div>';  
        echo '<div style="font-size:12px;font-style:italic;">***Document dianggap sah apabila terdapat tandatangan dan stempel***</div>';
        echo '<div><table style="width:100%;">
                <tr>
                    <td style="text-align:center;">Pengirim</td>
                    <td style="text-align:center;">Diterima Oleh:</td>
                    <td style="text-align:center;">Diperiksa Oleh:</td>
                </tr>
                <tr >
                    <td style="text-align:center;padding-top:100px;">(____________________________)</td>
                    <td style="text-align:center;padding-top:100px;">(____________________________)</td>
                    <td style="text-align:center;padding-top:100px;">(____________________________)</td>
                </tr></table></div>';  
    }

?>