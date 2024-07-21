<?php

// Create connection
$conn = new mysqli("localhost", "root", "", "forum");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Escape user inputs for security
    $full_name = $conn->real_escape_string($_POST['full_name']);
    $nickname = $conn->real_escape_string($_POST['nickname']);
    $user_id = $conn->real_escape_string($_POST['user_id']);
    $gender = $conn->real_escape_string($_POST['gender']);
    $age = $conn->real_escape_string($_POST['age']);
    $address = $conn->real_escape_string($_POST['address']);
    $email = $conn->real_escape_string($_POST['email']);
    $phone_number = $conn->real_escape_string($_POST['phone_number']);
    $country = $conn->real_escape_string($_POST['country']);
    $user_type = $conn->real_escape_string($_POST['user_type']);
    $program = $conn->real_escape_string($_POST['program']);
    $department = $conn->real_escape_string($_POST['department']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Encrypt password

    $avatar_url = '';
    if (isset($_FILES['avatar_url']) && $_FILES['avatar_url']['error'] == 0) {
        $upload_dir = 'image/avatars/';
        
        // Ensure the upload directory exists
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }
        
        $avatar_path = $upload_dir . basename($_FILES['avatar_url']['name']);
        if (move_uploaded_file($_FILES['avatar_url']['tmp_name'], $avatar_path)) {
            $avatar_url = $avatar_path;
        } else {
            echo "Sorry, there was an error uploading your file.";
            exit();
        }
    }

    // Insert user data into database
    $sql = "INSERT INTO users (full_name, nickname, user_id, gender, age, address, email, phone_number, country, user_type, program, department, password, avatar_url)
            VALUES ('$full_name', '$nickname', '$user_id', '$gender', '$age', '$address', '$email', '$phone_number', '$country', '$user_type', '$program', '$department', '$password', '$avatar_url')";

    if ($conn->query($sql) === TRUE) {
        // Registration successful, redirect to login page
        header("Location: index.html");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close connection
$conn->close();
?>
