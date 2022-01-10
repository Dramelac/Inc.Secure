<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shadow localhost service</title>
</head>
<body>
    <h1>Congratulations, you managed to bounce off to an internal web service!</h1>
    <div>
        <p>Connection received from <?php echo $_SERVER['REMOTE_ADDR']; ?> to <?php echo $_SERVER['HTTP_HOST']; ?></p>
        <p>Client User-agent : '<?php echo $_SERVER['HTTP_USER_AGENT']; ?>'</p>
    </div>
</body>
</html>