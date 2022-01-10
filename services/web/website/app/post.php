<?php
require("db.inc.php");

# Check existing param
if (!isset($_GET['id'])) {
    http_response_code(404);
    include("../common/404.php");
    die();
}
$id = $_GET['id'];
if (preg_match('/sqlmap/i',$_SERVER["HTTP_USER_AGENT"])){
    http_response_code(401);
    echo "An unauthorized character/request has been detected ! This query has been blocked.";
    die();
}

$result = $conn->query("select * from article where id=" . $id);
if ($result->num_rows === 0 or $result == null) {
    http_response_code(404);
    include("../common/404.php");
    die();
}
$post = $result->fetch_assoc();
?>

<?php include("../common/header.inc.php"); ?>

<!-- Page Header -->
<header class="masthead" style="background-image: url('../common/img/home.png')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1><?php echo $post['title']; ?></h1>
                    <span class="subheading"><?php echo "Posted on " . $post['creation_date'] . " by " . $post['author']; ?></span>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- Post Content -->
<article>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <?php echo $post['content']; ?>
            </div>
        </div>
    </div>
</article>

<?php include("../common/footer.inc.php"); ?>
