<?php
echo '<nav class="navbar navbar-expand-lg navbar-dark " style="background-color:#14213d;color:#f1faee;">
    <a class="navbar-brand" href="#">Matahari</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="searchengine1.php">Home <span class="sr-only">(current)</span></a>
        </li>
        
        <li class="nav-item dropdown active">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Maintenance
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="reginvent.php">Inventory</a>
            <a class="dropdown-item" href="reggroup.php">Groups</a>
            <a class="dropdown-item" href="regsupp.php">Suppliers</a>            
          </div>
        </li>

        <li class="nav-item dropdown active">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Transactions
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="salesdirect.php">Sales</a>
            <a class="dropdown-item" href="retsales.php">Sales Return</a>
            <a class="dropdown-item" href="purchase.php?action=new">Purchase</a>
            <a class="dropdown-item" href="retpcs.php">Purchase Return</a>               
          </div>
        </li>

        <li class="nav-item dropdown active">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Settings
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="company.php">Company Header</a>
            <a class="dropdown-item" href="#">Company Footer</a>
            <a class="dropdown-item" href="warehouse.php">Warehouse</a>
          </div>
        </li>
        <li class="nav-item  active">
            <a href="xlogout.php" class="nav-link nav-right"><span class="sr-only"></span> Logout</a>
        </li>
        
      </ul>
      
    </div>
  </nav>';
  ?>