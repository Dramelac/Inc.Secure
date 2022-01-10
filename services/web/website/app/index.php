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
                    <h1>Awesome Ultra Secure Blog</h1>
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
            <?php
            $results = $conn->query("select * from article order by creation_date desc ;");
            while ($row = $results->fetch_assoc()) { ?>
                <div class="post-preview">
                    <a href="post.php?id=<?php echo $row['id']; ?>">
                        <h2 class="post-title">
                            <?php echo $row['title']; ?>
                        </h2>
                    </a>
                    <p class="post-meta"><?php echo "Posted on " . $row['creation_date'] . " by " . $row['author']; ?></p>
                </div>
                <hr>
                <?php
            }
            ?>
        </div>
    </div>
</div>

<?php include("../common/footer.inc.php"); ?>
