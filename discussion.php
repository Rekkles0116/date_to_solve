<?php
session_start();
$nickname = isset($_SESSION['nickname']) ? $_SESSION['nickname'] : 'Guest';

// Database connection
$conn = new mysqli("localhost", "root", "", "forum");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch discussion and comments
$discussion_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Increment view count
$update_view_sql = "UPDATE discussions SET view_count = view_count + 1 WHERE id = $discussion_id";
if ($conn->query($update_view_sql) !== TRUE) {
    echo "Error updating view count: " . $conn->error;
}

// Fetch discussion details
$discussion_sql = "SELECT * FROM discussions WHERE id = $discussion_id";
$result = $conn->query($discussion_sql);
if ($result->num_rows > 0) {
    $discussion = $result->fetch_assoc();
} else {
    echo "Discussion not found.";
    exit();
}

// Fetch selected tags
$selectedTags = [];
$tags_sql = "SELECT tag FROM discussion_tags WHERE discussion_id = $discussion_id";
$tags_result = $conn->query($tags_sql);
if ($tags_result->num_rows > 0) {
    while ($tag_row = $tags_result->fetch_assoc()) {
        $selectedTags[] = $tag_row['tag'];
    }
}

// Handle new comment
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['comment'])) {
    $comment_content = $conn->real_escape_string($_POST['comment']);
    $author = isset($_SESSION['nickname']) ? $_SESSION['nickname'] : 'Anonymous';
    $sql = "INSERT INTO comments (discussion_id, content, author, created_at) VALUES ($discussion_id, '$comment_content', '$author', NOW())";
    if ($conn->query($sql) !== TRUE) {
        echo "Error: " . $conn->error;
    }
}

// Fetch comments and replies
$comments_sql = "SELECT c.*, u.avatar_url FROM comments c LEFT JOIN users u ON c.author = u.nickname WHERE c.discussion_id = $discussion_id ORDER BY c.created_at DESC";
$comments_result = $conn->query($comments_sql);
$comments = [];
$replies = [];

while ($row = $comments_result->fetch_assoc()) {
    $comment_id = $row['id'];
    $comments[$comment_id] = [
        'id' => $row['id'],
        'discussion_id' => $row['discussion_id'],
        'content' => $row['content'],
        'author' => $row['author'],
        'created_at' => $row['created_at'],
        'avatar_url' => $row['avatar_url'],
        'replies' => []
    ];
}

$comment_ids = array_keys($comments);
if (empty($comment_ids)) {
    $comment_ids = [0]; // Prevents SQL syntax error
}

$replies_sql = "SELECT r.*, u.avatar_url 
                FROM replies r 
                LEFT JOIN users u ON r.author = u.nickname 
                WHERE r.parent_comment_id IN (" . implode(',', $comment_ids) . ") 
                ORDER BY r.replies_at ASC";

$replies_result = $conn->query($replies_sql);

while ($row = $replies_result->fetch_assoc()) {
    $reply_id = $row['id'];
    $parent_comment_id = $row['parent_comment_id'];
    $replies[$reply_id] = [
        'id' => $reply_id,
        'parent_comment_id' => $parent_comment_id,
        'content' => $row['content'],
        'author' => $row['author'],
        'replies_at' => $row['replies_at'],
        'avatar_url' => $row['avatar_url']
    ];
    if (isset($comments[$parent_comment_id])) {
        $comments[$parent_comment_id]['replies'][$reply_id] = $replies[$reply_id];
    }
}





// Handle new reply
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['reply_comment']) && isset($_POST['parent_comment_id'])) {
    $reply_content = $conn->real_escape_string($_POST['reply_comment']);
    $parent_comment_id = intval($_POST['parent_comment_id']);
    $parent_reply_id = isset($_POST['parent_reply_id']) ? intval($_POST['parent_reply_id']) : 'NULL';
    $author = isset($_SESSION['nickname']) ? $_SESSION['nickname'] : 'Anonymous';
    $sql = "INSERT INTO replies (parent_comment_id, parent_reply_id, content, author, replies_at) 
            VALUES ($parent_comment_id, $parent_reply_id, '$reply_content', '$author', NOW())";

    if ($conn->query($sql) === TRUE) {
        header("Location: " . $_SERVER['REQUEST_URI']);
        exit();
    } else {
        echo "Error: " . $conn->error;
    }
}

$comment_ids = array_keys($comments);
if (empty($comment_ids)) {
    $comment_ids = [0]; // This prevents the SQL syntax error if there are no comments
}
$replies_sql = "SELECT r.*, u.avatar_url 
                FROM replies r 
                LEFT JOIN users u ON r.author = u.nickname 
                WHERE r.parent_comment_id IN (" . implode(',', $comment_ids) . ") 
                ORDER BY r.replies_at ASC";


$conn->close();





// Function to calculate time ago
function timeAgo($datetime) {
    $time = strtotime($datetime);
    $time_diff = time() - $time;

    if ($time_diff < 1) { return 'just now'; }
    $time_rules = array(
        12 * 30 * 24 * 60 * 60 => 'years',
        30 * 24 * 60 * 60 => 'months',
        24 * 60 * 60 => 'days',
        60 * 60 => 'hours',
        60 => 'minutes',
        1 => 'seconds'
    );

    $result = array();

    foreach ($time_rules as $secs => $str) {
        $d = $time_diff / $secs;
        if ($d >= 1) {
            $t = floor($d);
            $result[] = $t . ' ' . $str;
            $time_diff -= $t * $secs;
        }
    }

    return implode(' ', $result) . ' ago';
}
?>











<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="discussion.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Discussion</title>
    
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
        <a href="about.php"><i class="fas fa-info-circle"></i> About</a>
    </div>
    <div class="top-bar">
        <input type="text" placeholder="Search Discussion" class="search-bar">
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
        <div class="forum-discussion" id="discussion1">
            <div class="subforum-avatar">
            <div class="discussion_profile_image">
            <img src="<?php echo htmlspecialchars($discussion['avatar_url']); ?>" alt="User Avatar" class="profile-image">
            </div>
            <div class="subforum-nickname">
            <?php echo htmlspecialchars($discussion['nickname']); ?></div>
            </div>
           
            <div class="subforum-date">
                <small>Posted on <?php echo date("d M Y", strtotime($discussion['created_at'])); ?></small>
            </div>
            <div class="description">
                <h1><?php echo htmlspecialchars($discussion['title']); ?></h1>
            </div>
             <!-- Display Selected Tags -->
             <div class="selected-tags">
    <?php if (!empty($selectedTags)) : ?>
        <?php foreach ($selectedTags as $tag) : ?>
            <div class="tag-container">
                <?php echo htmlspecialchars($tag); ?>
            </div>
        <?php endforeach; ?>
    <?php else : ?>
     
    <?php endif; ?>
</div>

<div class="subforum-description">
    <p><?php echo nl2br(htmlspecialchars($discussion['content'])); ?></p>
    <?php if (!empty($discussion['image_path'])): ?>
        <div class="discussion-image-container">
            <img src="<?php echo htmlspecialchars($discussion['image_path']); ?>" alt="Discussion Image" class="discussion-image">
        </div>
    <?php endif; ?>
</div>
            <button class="view-more" style="display: none;" onclick="toggleContent('discussion1', 'viewCount1')">View More</button>

        </div>

        <div class="count-info" id="countInfo">
            Total Comments: <span id="totalComments"><?php echo $comments_result->num_rows; ?></span>
        </div>

        <div class="comment-input" id="commentInput1">
            <form method="post">
                <textarea rows="4" name="comment" placeholder="Add a comment..."></textarea>
                <button type="submit">Submit</button>
            </form>
        </div>

        <div class="comment-section">
        <h2>Comments</h2>

        <?php foreach ($comments as $comment): ?>
    <div class="comment-card">
        <div class="comment">
            <div class="avatar">
                <?php if (!empty($comment['avatar_url'])): ?>
                    <img src="<?php echo htmlspecialchars($comment['avatar_url']); ?>" alt="User Avatar">
                <?php else: ?>
                    <img src="default-avatar.png" alt="Default Avatar">
                <?php endif; ?>
            </div> 
            <div class="comment-content">
                <h3><?php echo htmlspecialchars($comment['author']); ?></h3>
                <p><?php echo nl2br(htmlspecialchars($comment['content'])); ?></p>
                <div class="comment-footer">
                    <small>Posted <?php echo timeAgo($comment['created_at']); ?></small>
                    <span class="reply-btn" onclick="toggleReplyForm(<?php echo $comment['id']; ?>)">Reply</span>
                </div>
            </div>
        </div>

        <div class="reply-form" id="replyForm<?php echo $comment['id']; ?>">
            <form method="post">
                <textarea rows="3" name="reply_comment" placeholder="Add a reply..."></textarea>
                <input type="hidden" name="parent_comment_id" value="<?php echo $comment['id']; ?>">
                <button type="submit">Submit</button>
            </form>
        </div>

        <?php if (!empty($comment['replies'])): ?>
            <div class="replies">
                <?php foreach ($comment['replies'] as $reply):
                    $avatarSrc = !empty($reply['avatar_url']) ? htmlspecialchars($reply['avatar_url']) : 'default-avatar.png';
                ?>
                    <div class="comment reply">
                        <div class="avatar">
                            <img src="<?php echo $avatarSrc; ?>" alt="User Avatar">
                        </div>
                        <div class="comment-content">
                            <h3><?php echo htmlspecialchars($reply['author']); ?></h3>
                            <p><?php echo nl2br(htmlspecialchars($reply['content'])); ?></p>
                            <div class="comment-footer">
                                <div class="reply-timestamp"><?php echo timeAgo($comment['created_at']);; ?></div>
                            </div>
                        </div>
                    </div>
                    <div class="reply-form" id="replyForm<?php echo $reply['id']; ?>">
                        <form method="post">
                            <textarea rows="3" name="reply_comment" placeholder="Add a reply..."></textarea>
                            <input type="hidden" name="parent_comment_id" value="<?php echo $comment['id']; ?>">
                            <input type="hidden" name="parent_reply_id" value="<?php echo $reply['id']; ?>">
                            <button type="submit">Submit</button>
                        </form>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
<?php endforeach; ?>

        </div>
    </div>

    <script>
document.addEventListener('DOMContentLoaded', function() {
    var showRepliesButtons = document.querySelectorAll('.show-replies');

    showRepliesButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var parentCommentCard = this.closest('.comment-card');
            var replyForm = parentCommentCard.querySelector('.reply-form');
            replyForm.style.display = replyForm.style.display === 'none' ? 'block' : 'none';
        });
    });
});



function toggleReplyForm(commentId) {
    var replyForm = document.getElementById('replyForm' + commentId);
    if (replyForm.style.display === 'none') {
        replyForm.style.display = 'block';
    } else {
        replyForm.style.display = 'none';
    }
}













    document.addEventListener('DOMContentLoaded', function() {
    var discussionElement = document.querySelector('.subforum-description');
    var content = discussionElement.innerHTML;
    var words = content.split(' ');
    var wordsPerLine = 20;
    var newContent = '';

    for (var i = 0; i < words.length; i++) {
        newContent += words[i] + ' ';
        if ((i + 1) % wordsPerLine === 0) {
            newContent += '<br>';
        }
    }

    discussionElement.innerHTML = newContent;
});

document.addEventListener('DOMContentLoaded', function() {
    var discussionElement = document.getElementById('discussion1');
    var viewMoreButton = document.querySelector('.view-more');

    // Add a temporary class to get the full content height
    discussionElement.classList.add('full-content');
    var fullHeight = discussionElement.scrollHeight;
    discussionElement.classList.remove('full-content');

    // Set the max height for the initial view
    var maxHeight = 250; // Set the desired max height
    discussionElement.style.maxHeight = maxHeight + 'px';

    // Check if the content exceeds the max height and display the button if it does
    if (fullHeight > maxHeight) {
        viewMoreButton.style.display = 'inline-block';
    }

    function toggleContent(discussionId) {
        var discussionElement = document.getElementById(discussionId);
        var viewMoreButton = document.querySelector('.view-more');

        if (discussionElement.classList.contains('expanded')) {
            discussionElement.classList.remove('expanded');
            discussionElement.style.maxHeight = maxHeight + 'px'; // Collapse back to max height
            viewMoreButton.innerText = 'View More';
        } else {
            discussionElement.classList.add('expanded');
            discussionElement.style.maxHeight = fullHeight + 'px'; // Expand to full height
            viewMoreButton.innerText = 'View Less';

            // Trigger a reflow to ensure images and content are displayed correctly
            discussionElement.offsetHeight; // Access offsetHeight to trigger reflow

            // Ensure images are reloaded
            var images = discussionElement.querySelectorAll('img');
            images.forEach(function(img) {
                img.src = img.src; // Force reload the image
            });
        }
    }

    // Assign the function to the button click
    viewMoreButton.onclick = function() {
        toggleContent('discussion1');
    };
});





    </script>
</body>
</html>
