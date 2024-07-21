<?php
session_start(); // Start session

// Database connection
$conn = new mysqli("localhost", "root", "", "forum");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$filter = isset($_GET['filter']) ? $_GET['filter'] : 'newest'; // Default filter is newest
$searchQuery = isset($_GET['search']) ? $_GET['search'] : '';

// Prepare the SQL query based on filter and search query
$sql = "SELECT * FROM discussions";
if (!empty($searchQuery)) {
    $sql .= " WHERE title LIKE '%" . $conn->real_escape_string($searchQuery) . "%'";
}
switch ($filter) {
    case 'oldest':
        $sql .= " ORDER BY created_at ASC";
        break;
    case 'newest':
    default:
        $sql .= " ORDER BY created_at DESC";
        break;
}

// Fetch discussions with user information
$result = $conn->query($sql);

$nickname = isset($_SESSION['nickname']) ? $_SESSION['nickname'] : 'Guest';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .subforum-nickname, .subforum-title {
            font-weight: bold;
            font-size: 18px;
        }
        .profile-image-container {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            display: inline-block;
            margin-right: 30px;
            
        }
        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .w3-border {
            border: 1px solid #ccc;
            width: 169.2px;
        }
        .search-bar-container {
            flex-grow: 1;
            display: flex;
            justify-content: center;
        }
        .search-bar {
            padding: 10px;
            margin-left: 200px;
            border-radius: 5px;
            border: 1px solid #ccc;
            position:relative;
            width: 800px;
            
        }
        .create-container {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #333;
            margin-left: 150px;
            }
    </style>
    <title>MDIS Forum</title>
</head>
<body>
    <div class="vertical-menu">
        <div class="menu-header">
            <a href="home.php">
                <img src="image/project logo.png" alt="Logo" class="logo">
            </a>
        </div>
        <a href="home.php" class="active"><i class="fas fa-home"></i> Home</a>
        <a href="trending.php"><i class="fas fa-chart-line"></i> Trending</a>
        <a href="about.php"><i class="fas fa-info-circle"></i> About</a>
    </div>
    <div class="top-bar">
        <form method="GET" action="home.php">
            <input type="text" name="search" placeholder="Search Discussion" class="search-bar" value="<?php echo htmlspecialchars($searchQuery); ?>" onkeypress="if(event.key === 'Enter'){ this.form.submit(); }">
        </form>
        <a href="create.php" class="create-container">
            <img src="image/edit.png" alt="create" class="create">
            <span>Create</span>
        </a>
        <a href="account detail.php" class="profile-icon-link">
            <div class="profile-image-container">
                <img src="<?php echo $_SESSION['avatar_url']; ?>" alt="User Avatar" class="profile-image">
            </div>
        </a>
    </div>
    <div class="content">
        <div class="w3-bar w3-border">
            <a href="home.php?filter=newest" class="w3-bar-item w3-button <?php if ($filter == 'newest') echo 'w3-black'; ?>">Newest</a>
            <a href="home.php?filter=oldest" class="w3-bar-item w3-button <?php if ($filter == 'oldest') echo 'w3-black'; ?>">Oldest</a>
        </div>

        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<a href='discussion.php?id=" . $row["id"] . "' class='forum-discussion-link'>";
                echo "<div class='forum-discussion'>";
                echo "<div class='profile-image-container'><img src='" . htmlspecialchars($row["avatar_url"]) . "' alt='User Avatar' class='profile-image'></div>";
                echo "<div class='subforum-nickname'>" . htmlspecialchars($row["nickname"]) . "</div>";
                echo "<div class='subforum-date'><small>Posted on " . $row["created_at"] . "</small></div>";
                echo "<div class='description'><h1 class='subforum-title'>" . htmlspecialchars($row["title"]) . "</h1></div>";
                echo "<div class='subforum-description'><p>" . htmlspecialchars($row["content"]) . "</p></div>";
                echo "</div></a>";
            }
        } else {
            echo "No discussions found.";
        }

        $conn->close();
        ?>
    </div>
</body>
</html>
