<?php
session_start();

// Database connection
$conn = new mysqli("localhost", "root", "", "forum");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Escape user inputs for security
    $title = $conn->real_escape_string($_POST['title']);
    $content = $conn->real_escape_string($_POST['content']);
    $created_at = date('Y-m-d H:i:s');
    $nickname = $_SESSION['nickname'];
    $avatar_url = $_SESSION['avatar_url'];

    // Validate content length (maximum 1000 words)
    $maxWords = 1000;
    $wordCount = str_word_count($content);

    if ($wordCount > $maxWords) {
        // Handle error: Display message to the user or truncate content
        echo "Content exceeds maximum word limit of $maxWords words.";
        exit();
    }

    // Handle image upload
    $image_path = '';
    if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
        $image_dir = 'image/';
        $image_path = $image_dir . basename($_FILES['image']['name']);
        move_uploaded_file($_FILES['image']['tmp_name'], $image_path);
    }

    // Insert discussion into 'discussions' table
    $sql = "INSERT INTO discussions (title, content, image_path, created_at, nickname, avatar_url) 
            VALUES ('$title', '$content', '$image_path', '$created_at', '$nickname', '$avatar_url')";

    if ($conn->query($sql) === TRUE) {
        $discussion_id = $conn->insert_id; // Get the ID of the newly inserted discussion

        // Insert selected tags into 'discussion_tags' table
        if (!empty($_POST['tags'])) {
            $tags = $_POST['tags'];
            // Ensure only up to 5 tags are inserted
            $tags = array_slice($tags, 0, 5); // Limit to maximum 5 tags

            // Prepare tag insertion SQL statement
            $tag_values = [];
            foreach ($tags as $tag) {
                $tag_values[] = "($discussion_id, '$tag')";
            }

            $tag_sql = "INSERT INTO discussion_tags (discussion_id, tag) VALUES " . implode(", ", $tag_values);

            if ($conn->query($tag_sql) === FALSE) {
                echo "Error inserting tags: " . $conn->error;
            }
        }

        // Redirect to home page after successful submission
        header("Location: home.php");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
