<?php
// Start the session
session_start();

// Include database connection file
require_once 'dbconnection.php';

// Check if the user is logged in
if (!isset($_SESSION['userid'])) {
  header("Location: index.html");
  exit();
}

// Get the nickname from the session
$nickname = isset($_SESSION['nickname']) ? $_SESSION['nickname'] : 'Guest';
?>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="post discussion.css">
  <title>Your Discussions</title>
</head>
<body>
  <div class="vertical-menu">
    <div class="menu-header">
      <a href="home.php">
        <img src="image/project logo.png" alt="Logo" class="logo">
      </a>
    </div>
    <a href="home.php"><i class="fas fa-home"></i> Home</a>
    <a href="trending.php"><i class="fas fa-chart-line"></i> Trending</a>
    <a href="about.html"><i class="fas fa-info-circle"></i> About</a>
    <br><br><br><br><br><br><br>
    <a href="post discussion.php">Post Discussion</a>
    <a href="history.php">History</a>
    <a href="account detail.php">Account Details</a>
  </div>

  <div class="top-bar">
    <i class="fas fa-user profile-icon"></i> <?php echo htmlspecialchars($nickname); ?>
  </div>


  </div>
</body>
</html>
  