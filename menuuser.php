<?php
echo '<nav class="navbar navbar-expand-lg navbar-dark " style="background-color:#14213d;color:#f1faee;">
    
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        

        <li class="nav-item dropdown active">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Transactions
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="salesdirect.php?action=new">Sales</a>
            
                 
          </div>
        </li>
        <li class="nav-item dropdown active">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Tools
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
         
            <a class="dropdown-item" href="backupdb.php">Backup Data</a>
          </div>
        </li>

        <li class="nav-item dropdown active">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Reports
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/reports/_rptsalesperdateperiod.php">Sales Per Period</a>
            <a class="dropdown-item" href="/reports/_rptsalesperdateperioddetail.php">Sales Per Period Detail</a>
            <a class="dropdown-item" href="/reports/_rptsalesperdateperinvoice.php">Sales Per Invoice</a>
          </div>
        </li>

        
        <li class="nav-item  active">
            <a href="xlogout.php" class="nav-link nav-right"><span class="sr-only"></span> Logout</a>
        </li>
      </ul>
    </div>
  </nav>';
