<?php
session_start();
    if($_POST['id']){
        $id = $_POST['id'];
        foreach($_SESSION["cart_item"] as $k=>$v)
				{
				//	echo 'forearch';
					if($id == $_SESSION["cart_item"][$k]["code"]){

				//		echo "<script type='text/javascript'>alert('ifff');</script)";
						unset($_SESSION["cart_item"][$k]);
                        echo 'OK';
					}
                }
    } 
?>