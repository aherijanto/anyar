<?php

    
        if ($_SESSION['usertype']=="admin"){
            echo '<a href="../reginvent.php">&copyANYAR<a>';
        }
        if ($_SESSION['usertype']=="user"){
            echo '<a href="../salesdirect.php?action=new">&copyANYAR</a>';
        }
?>