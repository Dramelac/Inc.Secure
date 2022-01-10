<?php
include("../../common/header.inc.php");
?>

<!-- Page Header -->
<header class="masthead" style="background-image: url('../../common/img/home.png')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>Secret admin panel</h1>
                    <span class="subheading">by Inc.Secure</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <p>
                This section is reserved for administrators !
            </p>
            <div>
                <p>Enter a URI to fetch</p>

                <form method="GET" action="#">
                            <span>IP:
                                <input name="r" type="text" placeholder="uri://example.com"/>
                                <input type="submit"/>
                            </span>

                </form>
                <br/>
            </div>
            <?php
            if (isset($_GET['r'])) {
                if (preg_match('/localhost/i',$_GET['r']) or preg_match('/127.0.0.1/i',$_GET['r'])){
                    echo "<p>Your request has been aborted to prevent illegal access to the localhost:8080 administration service.</p>";
                    die();
                }
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $_GET['r']);
                curl_setopt($ch, CURLOPT_HEADER, 1);
                $response = curl_exec($ch);
                curl_close($ch);
                if (!$response){
                    echo "Curl command didn't work...";
                }
            } else {
                echo "No request supplied.";
            }

            ?>
        </div>
    </div>

    <?php include("../../common/footer.inc.php"); ?>
