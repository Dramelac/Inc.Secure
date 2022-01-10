<?php
include("../common/header.inc.php");
require("db.inc.php");
?>

<!-- Page Header -->
<header class="masthead" style="background-image: url('../common/img/home.png')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>Login</h1>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- Page Content -->
<article>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">

                <?php
                $print_form = true;
                if (isset($_POST["username"]) and !empty($_POST["username"]) and
                    isset($_POST["password"]) and !empty($_POST["password"])) {
                    if (preg_match('/sqlmap/i',$_SERVER["HTTP_USER_AGENT"])){
                        echo "ATTACK DETECTED";
                        die();
                    }
                    $result = $conn->query("SELECT username,password from user where username='" . $_POST["username"] . "' and password='" . $_POST["password"] . "'");
                    if ($result){
                        $row = $result->fetch_assoc();
                        if ($row != null) {
                            $print_form = false;
                            if ($row["username"] === "admin") {
                                echo "<div class='alert-success text-center'>Welcome Admin !<br><a href='admin/secret.php'>The secret admin panel is here.</a></div>";
                            } else {
                                echo "<div class='alert-info text-center'>Welcome " . $row["username"] . "</div>";
                            }
                        }
                    } else {
                        echo "<div class='alert-danger text-center'>Error</div>";
                    }

                }
                if ($print_form) {
                    echo '
                <form id="login-form" method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>';
                }
                ?>

            </div>
        </div>
    </div>
</article>

<?php include("../common/footer.inc.php"); ?>
