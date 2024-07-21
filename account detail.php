<?php
session_start();
$conn = new mysqli("localhost", "root", "", "forum");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle file upload
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['fileupload'])) {
    $target_dir = "uploads/";
    if (!file_exists($target_dir)) {
        mkdir($target_dir, 0777, true);
    }
    
    $target_file = $target_dir . basename($_FILES["fileupload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    $check = getimagesize($_FILES["fileupload"]["tmp_name"]);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }

    if (file_exists($target_file)) {
        echo "Sorry, file already exists.";
        $uploadOk = 0;
    }

    if ($_FILES["fileupload"]["size"] > 500000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }

    if (!in_array($imageFileType, ['jpg', 'png', 'jpeg', 'gif'])) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileupload"]["tmp_name"], $target_file)) {
            $nickname = $_SESSION['nickname'];
            $sql = "UPDATE users SET avatar_url='$target_file' WHERE nickname='$nickname'";
            if ($conn->query($sql) !== TRUE) {
                echo "Error updating record: " . $conn->error;
            }
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}

// Handle user details update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_FILES['fileupload'])) {
  $nickname = $_POST['nickname'];
  $gender = $_POST['gender'];
  $address = $_POST['address'];
  $email = $_POST['email'];
  $phone_number = $_POST['phone_number'];
  $password = $_POST['password'];
  $confirm_password = $_POST['confirm_password'];

  if ($password !== $confirm_password) {
      $_SESSION['error'] = "Passwords do not match.";
      header("Location: account detail.php");
      exit();
  }

  // Encrypt the new password
  $hashed_password = password_hash($password, PASSWORD_DEFAULT);

  if ($currentUser['password'] !== $hashed_password) {
    $updateFields[] = "password='$hashed_password'";
}

  // Retrieve the current data for the existing nickname
  $current_nickname = $_SESSION['nickname'];
  $sql = "SELECT * FROM users WHERE nickname='$current_nickname'";
  $result = $conn->query($sql);
  $currentUser = $result->fetch_assoc();

  $updateFields = [];
  if ($currentUser['nickname'] !== $nickname) {
      $updateFields[] = "nickname='$nickname'";
      $_SESSION['nickname'] = $nickname;
  }
  if ($currentUser['gender'] !== $gender) {
      $updateFields[] = "gender='$gender'";
  }
  if ($currentUser['address'] !== $address) {
      $updateFields[] = "address='$address'";
  }
  if ($currentUser['email'] !== $email) {
      $updateFields[] = "email='$email'";
  }
  if ($currentUser['phone_number'] !== $phone_number) {
      $updateFields[] = "phone_number='$phone_number'";
  }
  if ($currentUser['password'] !== $hashed_password) {
      $updateFields[] = "password='$hashed_password'";
  }

 if (count($updateFields) > 0) {
      $updateQuery = "UPDATE users SET " . implode(', ', $updateFields) . " WHERE nickname='$current_nickname'";
      if ($conn->query($updateQuery) === TRUE) {
          header("Location: account detail.php");
          exit();
      } else {
          echo "Error updating record: " . $conn->error;
      }
  }
}

// Fetch user information
$nickname = isset($_SESSION['nickname']) ? $_SESSION['nickname'] : 'Guest';
$avatar_url = 'default.png';

$sql = "SELECT * FROM users WHERE nickname='$nickname'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  $user = $result->fetch_assoc();
  // Extract user details
  $full_name = $user['full_name'];
  $gender = $user['gender'];
  $age = $user['age'];
  $country = $user['country'];
  $user_id = $user['user_id'];
  $program = $user['program'];
  $user_type = $user['user_type'];
  $department = $user['department'];
  $address = $user['address'];
  $email = $user['email'];
  $phone_number = $user['phone_number'];
  $password = $user['password'];
  $avatar_url = $user['avatar_url'];
} else {
  $user = [
      'nickname' => 'Guest',
      'full_name' => '',
      'gender' => '',
      'age' => '',
      'country' => '',
      'user_id' => '',
      'program' => '',
      'user_type' => '',
      'department' => '',
      'address' => '',
      'email' => '',
      'phone_number' => '',
      'password' => '',
      'avatar_url' => 'default.png'
  ];
}


$conn->close();
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="account detail.css">
  <title>About </title>
</head>

<body>

  <div class="vertical-menu">
    <div class="menu-header">
      <a href="home.php">
        <img src="image/project logo.png" alt="Logo" class="logo">
      </a>
    </div>
    <a href="home.php" ><i class="fas fa-home"></i> Home</a>
    <a href="trending.php"><i class="fas fa-chart-line"></i> Trending</a>
    <a href="about.html"><i class="fas fa-info-circle"></i> About</a>
            <br><br><br><br><br><br><br>
    <a href="post discussion.php">Post Discussion</a>
    <a href="history.php">History</a>
    <a href="account detail.php">Account Details</a>
  </div>

  <div class="top-bar">
    <i class="fas fa-user profile-icon"><?php echo $nickname; ?></i>
  </div>

  <div class="profile-image">
    <div class="user-info">
        <img id="profilePic" src="<?php echo htmlspecialchars($avatar_url); ?>" class="rounded-circle" width="150" alt="Profile Picture">
        <span class="details"><?php echo htmlspecialchars($nickname); ?></span>
    </div>
    <div class="up">
        <form method="POST" enctype="multipart/form-data">
            <label class="custom-file-upload">
                <input type="file" name="fileupload" accept="image/*" onchange="this.form.submit()">
                <span>Upload New Picture</span>
            </label>
        </form>
    </div>
</div>



    

  <div class="account">
  <form method="POST" enctype="multipart/form-data">
    <div class="a box">
      <fieldset>
        <legend>General</legend>
          <div class="details-group">
          <span class="details">Full Name : <?php echo $user['full_name']; ?></span>
            <div class="input-box">
            <label class="details">Nickname : </label>
            <input type="text" name="nickname" value="<?php echo $user['nickname']; ?>" required>    
                </div>
          </div>

          <div class="details-group">
          <div class="input-box">
          <span class="details">Gender :</span>
          <select name="gender" class="gender-select" required>
      <option value="MALE" <?php echo $user['gender'] === 'MALE' ? 'selected' : ''; ?>>MALE</option>
      <option value="FEMALE" <?php echo $user['gender'] === 'FEMALE' ? 'selected' : ''; ?>>FEMALE</option>
    </select>
  </div>
          <span class="details">Age : <?php echo $user['age']; ?></span>
          </div>
          
          <div class="details-group">
          <span class="details">Country : <?php echo $user['country']; ?></span>
          </div>
        </fieldset>
    </div>
      
    <div class="b box">
        <fieldset>
          <legend>Role</legend>
          <div class="details-group">
          <span class="details">ID : <?php echo $user['user_id']; ?></span>
          <span class="details">Program : <?php echo $user['program']; ?></span>
          </div>

          <div class="details-group">
          <span class="details">User Type : <?php echo $user['user_type']; ?></span>
          <span class="details">Department : <?php echo $user['department']; ?></span>
          </div>
        </fieldset>
    </div>
  
      <div class="c box">
        <fieldset>
          <legend>User Detail</legend><br><br>
          <div class="input-box">
          <label class="details">Email Address :</label>
            <input type="email" name="email" value="<?php echo $user['email']; ?>" required>
            </div>
            <br><br><br><br><br>
            <div class="input-box">
            <label class="details">Phone Number :</label>
            <input type="phone_number" name="phone_number" value="<?php echo $user['phone_number']; ?>" required>
            </div>
            <br><br><br><br><br>
            <div class="input-box">
          <label class="details">Address :</label>
            <input type="address" name="address" value="<?php echo $user['address']; ?>" required>
            </div>
            <br><br>
        </fieldset>
      </div>
        
      <div class="d box">
        <fieldset>
          <legend>Privacy</legend><br><br>
          <div class="input-box">
          <label class="details">Password :</label>
            <input type="password" name="password" value="<?php echo $user['password']; ?>" required>
          </div>
            <br><br><br><br><br>
            <div class="input-box">
      <label class="details">Confirm Password :</label>
      <input type="password" name="confirm_password" required>
    </div>
    <br><br>
    <?php if (isset($_SESSION['error'])): ?>
    <div class="error-message">
        <?php
        echo $_SESSION['error'];
        unset($_SESSION['error']);
        ?>
    </div>
<?php endif; ?>
        </fieldset>
      </div>

      <button class="button">Submit</button>

  </form>

  </div>

  <script>
    // Function to track clicks on links
    document.addEventListener('DOMContentLoaded', function() {
      var links = document.querySelectorAll('.vertical-menu a');
      links.forEach(function(link) {
        link.addEventListener('click', function(event) {
          var linkText = event.target.textContent.trim();
          var username = document.querySelector('.username').textContent.trim();
          var timestamp = new Date().toISOString();

          // Example: send this information to a server-side script for logging
          // Replace this with actual server-side code to handle logging to a database
          console.log(`User '${username}' clicked on '${linkText}' at '${timestamp}'`);
        });
      });
    });

    function previewFile(input) {
      var file = input.files[0];
      var reader = new FileReader();
      reader.onload = function (e) {
        document.getElementById('profilePic').src = e.target.result;
      };
      if (file) {
        reader.readAsDataURL(file);
      }
    }
  </script>
    
</body>

</html>
