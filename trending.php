<?php
session_start(); // Start session

// Database connection
$conn = new mysqli("localhost", "root", "", "forum");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if user is logged in
if (!isset($_SESSION['nickname'])) {
    header("Location: login page.html"); // Redirect to login page if not logged in
    exit();
}

$nickname = $_SESSION['nickname'];

// Determine the filter type
$filter = isset($_GET['filter']) ? $_GET['filter'] : 'all'; // Default filter is all time

// Prepare the SQL query based on filter
switch ($filter) {
    case 'past7':
        $timeCondition = "created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)";
        break;
    case 'past30':
        $timeCondition = "created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)";
        break;
    case 'all':
    default:
        $timeCondition = "1"; // All time filter (no time condition)
        break;
}

// Initialize search query
$searchQuery = "";

// Check if search form is submitted
if (isset($_GET['search'])) {
    $search = $_GET['search'];
    // Prevent SQL injection with prepared statement
    $searchQuery = " AND (title LIKE ? OR content LIKE ?)";
}

// Prepare SQL statement
$sql = "SELECT * FROM discussions WHERE $timeCondition $searchQuery ORDER BY view_count DESC";

// Use prepared statement to prevent SQL injection
$stmt = $conn->prepare($sql);

if ($searchQuery) {
    $searchTerm = "%$search%";
    $stmt->bind_param("ss", $searchTerm, $searchTerm);
}

$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="home.css">
    <title>Trending</title>
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
            width: 345.49px;
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


   
        .medal {
            width: 50px; /* Adjust size as needed */
            height: auto;
            margin-right: 5px;
            float: right;
        }
        .filter {
            margin-left: -15px;
        }
        /* Remove hyperlink styling */
        .profile-icon-link {
            text-decoration: none;
            color: inherit;
        }
        .profile-icon-link:hover,
        .profile-icon-link:focus {
            color: inherit;
        }



       
    </style>
</head>
<body>
    <div class="vertical-menu">
        <div class="menu-header">
            <a href="home.php">
                <img src="image/project logo.png" alt="Logo" class="logo">
            </a>
        </div>
        <a href="home.php"><i class="fas fa-home"></i> Home</a>
        <a href="trending.php?filter=all" <?php if ($filter == 'all') echo 'class="active"'; ?>><i class="fas fa-chart-line"></i> Trending</a>
        <a href="about.php"><i class="fas fa-info-circle"></i> About</a>
    </div>
    <div class="top-bar">
        <form method="GET" action="trending.php">
            <input type="text" name="search" placeholder="Search Discussion" class="search-bar">
           
            <input type="hidden" name="filter" value="<?php echo htmlspecialchars($filter); ?>">
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
        <div class="filter w3-container">
            <div class="w3-bar w3-border">
                <a href="trending.php?filter=all" class="w3-bar-item w3-button <?php if ($filter == 'all') echo 'w3-black'; ?>">All Time</a>
                <a href="trending.php?filter=past7" class="w3-bar-item w3-button <?php if ($filter == 'past7') echo 'w3-black'; ?>">Past 7 Days</a>
                <a href="trending.php?filter=past30" class="w3-bar-item w3-button <?php if ($filter == 'past30') echo 'w3-black'; ?>">Past 30 Days</a>
            </div>

            <?php
            $rank = 1;
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $medalClass = '';
                    switch ($rank) {
                        case 1:
                            $medalClass = 'gold-medal.png';
                            break;
                        case 2:
                            $medalClass = 'silver-medal.png';
                            break;
                        case 3:
                            $medalClass = 'bronze-medal.png';
                            break;
                        default:
                            $medalClass = '';
                            break;  
                    }

                    echo "<a href='discussion.php?id=" . $row["id"] . "' class='forum-discussion-link'>";
                    echo "<div class='forum-discussion'>";
                    if ($medalClass) {
                        echo "<img src='image/$medalClass' class='medal' alt='Medal'>";
                    }
                    echo "<div class='profile-image-container'><img src='" . htmlspecialchars($row["avatar_url"]) . "' alt='User Avatar' class='profile-image'></div>";
                    echo "<div class='subforum-nickname'>" . htmlspecialchars($row["nickname"]) . "</div>";
                    echo "<div class='subforum-date'><small>Posted on " . $row["created_at"] . "</small></div>";
                    echo "<div class='description'><h1 class='subforum-title'>" . htmlspecialchars($row["title"]) . "</h1></div>";
                    echo "<div class='subforum-description'><p>" . $row["content"] . "</p></div>";
                    echo "</div></a>";

                    $rank++;
                }
            } else {
                echo "No discussions found.";
            }

            $conn->close();
            ?>
        </div>
    </div>
    <script>
        function showFilters() {
            var filterOptions = document.getElementById("filterOptions");
            filterOptions.classList.toggle("show");
        }
    </script>
</body>
</html>