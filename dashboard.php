<?php
session_start();
?>
<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<?php
require_once('./assets/requires/config.php');
require_once('./assets/requires/headerdshbd.php');
?>

<body class="container">
    <div style="padding-top:40px;color:#7209b7;font-size:32px;">DASHBOARD</div>
    <div style="padding-top:10px;color:#1e6091;font-size:20px;"><?php echo 'WELCOME, ' . $_SESSION['user']; ?> </div>

    <div class="card-deck" style="padding-top:20px;">
        <div class="card">
            <!-- <img class="card-img-top" src="..." alt="Card image cap">!-->
            <div class="card-body" style="background-color:#8eecf5">
                <h5 class="card-title">Home</h5>
                <p class="card-text">Go to Home to start your Maintenance, Transactions, Reports, etc</p>
            </div>
            <div class="card-footer">
                <small class="text-muted"><a href="searchengine1.php">Go Home</a></small>
            </div>
        </div>

        <div class="card">
            <div class="card-body" style="background-color:#e9c46a">
                <h5 class="card-title">Sales</h5>
                <p class="card-text">Available Soon.</p>
            </div>
            <div class="card-footer">
                <small class="text-muted">Sales - Transaction</small>
            </div>
        </div>

        <div class="card">
            <div class="card-body" style="background-color:#cdb4db">
                <h5 class="card-title">Account Receivable</h5>
                <p class="card-text">Available Soon</p>
            </div>
            <div class="card-footer">
                <small class="text-muted">Account Receivable</small>
            </div>
        </div>

        <div class="card">
            <div class="card-body" style="background-color:#ffafcc">
                <h5 class="card-title">Purchasing</h5>
                <p class="card-text">Available Soon</p>
            </div>
            <div class="card-footer">
                <small class="text-muted">Purchasing - Transaction</small>
            </div>
        </div>

        <div class="card">
            <div class="card-body" style="background-color:#fdffb6">
                <h5 class="card-title">Account Payable</h5>
                <p class="card-text">Available Soon</p>
            </div>
            <div class="card-footer">
                <small class="text-muted">Account Payable</small>
            </div>
        </div>
    </div>

</body>

</html>