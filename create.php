<?php
session_start();
$nickname = isset($_SESSION['nickname']) ? $_SESSION['nickname'] : 'Guest';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="home.css">
    <title>Create Discussion</title>
    <style>
        body {
            background-color: #f0f2f5;
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
            margin-left: 1298px;
            }
        .create-form-container {
            margin-left: 30%;
            margin-top: 100px;
            padding: 20px;
            padding-bottom: 500px;
            flex: 1;
            border: 1px solid #ddd;
            border-radius: 12px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
        }

        .create-form-container h2 {
            margin-bottom: 20px;
            color: #0079d3;
            font-weight: bold;
        }

        .create-form {
            display: flex;
            flex-direction: column;
        }

        .create-form input[type="text"],
        .create-form textarea,
        .create-form input[type="file"] {
            margin-bottom: 16px;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 100%;
            max-width: 600px;
            box-sizing: border-box;
        }

        .create-form button {
            padding: 12px 16px;
            border: none;
            border-radius: 8px;
            background-color: #0079d3;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .create-form button:hover {
            background-color: #005bb5;
        }

        .create_title {
            margin-bottom: 8px;
        }

        .profile-image-container {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            display: inline-block;
            margin-right: 10px;
        }
        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .w3-border {
            border: 1px solid #ccc;
            width: 13.55%;
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
            margin-left: px;
            }


     
            .tag-list {
    columns: 5; /* Display in five columns */
    column-gap: 20px; /* Adjust gap between columns */
    list-style-type: none; /* Remove default list styling */
    padding: 0; /* Remove default padding */
    max-height: 200px; /* Limit height to show initially */
    overflow-y: auto; /* Enable vertical scrolling */
}

.tag-list li {
    display: none; /* Hide all list items initially */
    margin-bottom: 8px; /* Add space between items */
}

.tag-list li.show {
    display: block; /* Show list items matching filter */
}

    .tag-list label {
        display: inline-block;
        padding: 8px 12px;
        border-radius: 6px;
        background-color: #f0f0f0;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .tag-list input[type="checkbox"] {
        display: none; /* Hide the actual checkbox */
    }

    /* Hover effect */
    .tag-list label:hover {
        background-color: #0079d3;
        color: #fff;
    }

    /* Checked effect */
    .tag-list input[type="checkbox"]:checked + label {
        background-color: #005bb5;
        color: #fff;
    }

    .selected-tags-container {
    margin-top: 20px;
    margin-bottom: 50px;
}

.selected-tags-list {
    list-style-type: none;
    padding: 0;
}

.selected-tags-list li {
    display: inline-block;
    background-color: #0079d3;
    color: #fff;
    padding: 4px 8px;
    border-radius: 4px;
    margin-right: 8px;
    margin-bottom: 8px;
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
        <a href="trending.php"><i class="fas fa-chart-line"></i> Trending</a>
        <a href="about.php"><i class="fas fa-info-circle"></i> About</a>
    </div>
    <div class="top-bar">
        
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


    <div class="create-form-container">
        <h2>Create New Discussion</h2>
        <form class="create-form" action="submit_discussion.php" method="POST" enctype="multipart/form-data">
            <label for="title" class="create_title">
                <b>Title</b>
            </label>
            <input type="text" name="title" placeholder="Discussion Title" required>

           
            <label for="content"><b>Description</b></label>
            <textarea id="content" name="content" placeholder="Discussion Content (Maximum 1000 characters)" required></textarea>
    <div id="wordCount">0 / 1000 characters</div>
    <div id="warningMessage" style="color: red; display: none;">Exceeds maximum character limit!</div>
            <label for="image" class="create_title">
                <b>Image</b>
            </label>
            <input type="file" name="image" id="image">

            <label for="tags" class="create_title">
                <b>Tags</b>
            </label>
            <div class="tag-category">
 
        <input type="text" id="tagFilter" placeholder="Search tags...">
        <input type="text" id="customTagInput" placeholder="Add custom tag...">
        <button id="addCustomTagBtn">Add Tag</button>

        <div class="selected-tags-container">
    <h3>Selected Tags:</h3>
    <ul class="selected-tags-list">
        <!-- Selected tags will be dynamically added here -->
    </ul>
    <div id="tagError" style="color: red; margin-bottom: 10px;"></div>

</div>

        <ul class="tag-list">
        <li><input type="checkbox" id="general" name="tags[]" value="general"><label for="general">General</label></li>
        <li><input type="checkbox" id="CIB" name="tags[]" value="CIB"><label for="CIB">CIB</label></li>
        <li><input type="checkbox" id="CEP" name="tags[]" value="CEP"><label for="CIE">CEP</label></li>
        <li><input type="checkbox" id="FIB" name="tags[]" value="FIB"><label for="FIB">FIB</label></li>
        <li><input type="checkbox" id="DIB" name="tags[]" value="DIB"><label for="DIB">DIB</label></li>
        <li><input type="checkbox" id="dia" name="tags[]" value="dia"><label for="dia">DIA</label></li>
        <li><input type="checkbox" id="dbm" name="tags[]" value="dbm"><label for="dbm">DBM</label></li>
        <li><input type="checkbox" id="dim" name="tags[]" value="dim"><label for="dim">DIM</label></li>
        <li><input type="checkbox" id="dmc" name="tags[]" value="dmc"><label for="dmc">DMC</label></li>
        <li><input type="checkbox" id="dtm" name="tags[]" value="dtm"><label for="dtm">DTM</label></li>
        <li><input type="checkbox" id="dhm" name="tags[]" value="dhm"><label for="dhm">DHM</label></li>
        <li><input type="checkbox" id="dit" name="tags[]" value="dit"><label for="dit">DIT</label></li>
        <li><input type="checkbox" id="ditdm" name="tags[]" value="ditdm"><label for="ditdm">DITDM</label></li>
        <li><input type="checkbox" id="baf" name="tags[]" value="baf"><label for="baf">BAF</label></li>
        <li><input type="checkbox" id="bbf" name="tags[]" value="bbf"><label for="bbf">BBF</label></li>
        <li><input type="checkbox" id="bbm" name="tags[]" value="bbm"><label for="bbm">BBM</label></li>
        <li><input type="checkbox" id="bmkt" name="tags[]" value="bmkt"><label for="bmkt">BMKT</label></li>
        <li><input type="checkbox" id="bmcc" name="tags[]" value="bmcc"><label for="bmcc">BMCC</label></li>
        <li><input type="checkbox" id="bithm" name="tags[]" value="bithm"><label for="bithm">BITHM</label></li>
        <li><input type="checkbox" id="sales" name="tags[]" value="SALES"><label for="sales">SALES</label></li>
        <li><input type="checkbox" id="marketing" name="tags[]" value="MARKETING"><label for="marketing">MARKETING</label></li>
        <li><input type="checkbox" id="property-management" name="tags[]" value="PROPERTY MANAGEMENT"><label for="property-management">PROPERTY MANAGEMENT</label></li>
        <li><input type="checkbox" id="hostel-management" name="tags[]" value="HOSTEL MANAGEMENT"><label for="hostel-management">HOSTEL MANAGEMENT</label></li>
        <li><input type="checkbox" id="quality-management" name="tags[]" value="QUALITY MANAGEMENT"><label for="quality-management">QUALITY MANAGEMENT</label></li>
        <li><input type="checkbox" id="finance" name="tags[]" value="FINANCE"><label for="finance">FINANCE</label></li>
        <li><input type="checkbox" id="office-of-the-register" name="tags[]" value="OFFICE OF THE REGISTER"><label for="office-of-the-register">OFFICE OF THE REGISTER</label></li>
        <li><input type="checkbox" id="academic-affairs" name="tags[]" value="ACADEMIC AFFAIRS"><label for="academic-affairs">ACADEMIC AFFAIRS</label></li>
        <li><input type="checkbox" id="human-resources" name="tags[]" value="HUMAN RESOURCES"><label for="human-resources">HUMAN RESOURCES</label></li>
        <li><input type="checkbox" id="community-engagement" name="tags[]" value="community-engagement"><label for="community-engagement">Community Engagement</label></li>
        <li><input type="checkbox" id="student-experience" name="tags[]" value="student-experience"><label for="student-experience">Student Experience</label></li>
        <li><input type="checkbox" id="campus-life" name="tags[]" value="campus-life"><label for="campus-life">Campus Life</label></li>
        <li><input type="checkbox" id="student-discussions" name="tags[]" value="student-discussions"><label for="student-discussions">Student Discussions</label></li>
        <li><input type="checkbox" id="academic-support" name="tags[]" value="academic-support"><label for="academic-support">Academic Support</label></li>
        <li><input type="checkbox" id="student-activities" name="tags[]" value="student-activities"><label for="student-activities">Student Activities</label></li>
        <li><input type="checkbox" id="feedback-mechanism" name="tags[]" value="feedback-mechanism"><label for="feedback-mechanism">Feedback Mechanism</label></li>  
        <li><input type="checkbox" id="institutional-issues" name="tags[]" value="institutional-issues"><label for="institutional-issues">Institutional Issues</label></li>
        <li><input type="checkbox" id="student-satisfaction" name="tags[]" value="student-satisfaction"><label for="student-satisfaction">Student Satisfaction</label></li>
        <li><input type="checkbox" id="sports" name="tags[]" value="sports"><label for="sports">Sports</label></li>
        <li><input type="checkbox" id="events" name="tags[]" value="events"><label for="events">Events</label></li>
        <li><input type="checkbox" id="clubs" name="tags[]" value="clubs"><label for="clubs">Clubs</label></li>
        <li><input type="checkbox" id="mental-health" name="tags[]" value="mental-health"><label for="mental-health">Mental Health</label></li>
        <li><input type="checkbox" id="health-services" name="tags[]" value="health-services"><label for="health-services">Health Services</label></li>
        <li><input type="checkbox" id="assignments" name="tags[]" value="assignments"><label for="assignments">Assignments</label></li>
        <li><input type="checkbox" id="exams" name="tags[]" value="exams"><label for="exams">Exams</label></li>
        <li><input type="checkbox" id="projects" name="tags[]" value="projects"><label for="projects">Projects</label></li>
        <li><input type="checkbox" id="group-studies" name="tags[]" value="group-studies"><label for="group-studies">Group Studies</label></li>
        <li><input type="checkbox" id="lectures" name="tags[]" value="lectures"><label for="lectures">Lectures</label></li>
        <li><input type="checkbox" id="tutorials" name="tags[]" value="tutorials"><label for="tutorials">Tutorials</label></li>
        <li><input type="checkbox" id="research" name="tags[]" value="research"><label for="research">Research</label></li>
        <li><input type="checkbox" id="labs" name="tags[]" value="labs"><label for="labs">Labs</label></li>
        <li><input type="checkbox" id="homework" name="tags[]" value="homework"><label for="homework">Homework</label></li>
        <li><input type="checkbox" id="presentations" name="tags[]" value="presentations"><label for="presentations">Presentations</label></li>
        <li><input type="checkbox" id="course-materials" name="tags[]" value="course-materials"><label for="course-materials">Course Materials</label></li>
        <li><input type="checkbox" id="study-tips" name="tags[]" value="study-tips"><label for="study-tips">Study Tips</label></li>
        <li><input type="checkbox" id="kopi" name="tags[]" value=kopi"><label for="kopi">kopitiam</label></li>
        </ul>
    </div>

    <button type="submit" id="submitBtn">Submit</button>
        </form>
    </div>



    <script>
document.addEventListener('DOMContentLoaded', function() {
    const checkboxes = document.querySelectorAll('.tag-list input[type="checkbox"]');
    const tagFilter = document.getElementById('tagFilter');
    const customTagInput = document.getElementById('customTagInput');
    const tagList = document.querySelector('.tag-list');
    const selectedTagsList = document.querySelector('.selected-tags-list');
    const errorDisplay = document.getElementById('tagError');
    let addedTags = []; // Array to store added tags

    // Function to create a new custom tag
    function createCustomTag(tagName) {
        // Check if the tag already exists
        const existingTag = document.getElementById(tagName);
        if (existingTag) {
            alert('Tag already exists.');
            return;
        }

        // Check if maximum tags limit (5) has been reached
        if (addedTags.length >= 5) {
            errorDisplay.textContent = 'You can select up to 5 tags.';
            setTimeout(() => {
                errorDisplay.textContent = ''; // Clear error message after a few seconds
            }, 3000); // 3000 milliseconds = 3 seconds
            return;
        }

        // Create new list item
        const li = document.createElement('li');
        li.classList.add('show'); // Initially show the custom tag
        li.innerHTML = `<input type="checkbox" id="${tagName}" name="tags[]" value="${tagName}" checked>
                        <label for="${tagName}">${tagName}</label>`;
        tagList.appendChild(li);
        
        // Add tag to addedTags array
        addedTags.push(tagName);

        // Update selected tags display
        updateSelectedTagsDisplay();
    }

    // Event listener for adding custom tag
    addCustomTagBtn.addEventListener('click', function(event) {
        event.preventDefault(); // Prevent form submission
        const customTagName = customTagInput.value.trim();
        
        if (customTagName !== '') {
            createCustomTag(customTagName); // Create and add the custom tag
            customTagInput.value = ''; // Clear input field after adding tag
        } else {
            alert('Please enter a valid tag name.');
        }
    });

    // Function to handle checkbox change
    function handleCheckboxChange() {
        let checkedCount = document.querySelectorAll('.tag-list input[type="checkbox"]:checked').length;
        if (checkedCount > 5) {
            this.checked = false;
            errorDisplay.textContent = 'You can select up to 5 tags.';
            setTimeout(() => {
                errorDisplay.textContent = ''; // Clear error message after a few seconds
            }, 3000); // 3000 milliseconds = 3 seconds
        } else {
            const tagValue = this.value;
            if (this.checked) {
                addedTags.push(tagValue); // Add tag to the list
            } else {
                const index = addedTags.indexOf(tagValue);
                if (index > -1) {
                    addedTags.splice(index, 1); // Remove tag from the list
                }
            }
            updateSelectedTagsDisplay(); // Update the displayed tags
        }
    }

    // Function to update selected tags display
    function updateSelectedTagsDisplay() {
        // Clear existing selected tags
        selectedTagsList.innerHTML = '';

        // Add selected tags to the list
        addedTags.forEach(tag => {
            const li = document.createElement('li');
            li.textContent = tag;
            selectedTagsList.appendChild(li);
        });
    }

    // Event listener for tag filter input
    tagFilter.addEventListener('input', function() {
        const filterValue = tagFilter.value.toLowerCase();
        
        checkboxes.forEach(function(checkbox) {
            const labelText = checkbox.nextElementSibling.textContent.toLowerCase();
            const checkboxParent = checkbox.parentElement;
            
            if (labelText.includes(filterValue)) {
                checkboxParent.classList.add('show');
            } else {
                checkboxParent.classList.remove('show');
            }
        });
    });

    // Show initial tags matching the filter input
    tagFilter.dispatchEvent(new Event('input'));

    // Add event listeners to checkboxes
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', handleCheckboxChange);
    });
});



document.addEventListener('DOMContentLoaded', function() {
    const contentInput = document.getElementById('content');
    const wordCount = document.getElementById('wordCount');
    const warningMessage = document.getElementById('warningMessage');

    contentInput.addEventListener('input', function() {
        const content = this.value;
        const length = content.length;
        wordCount.textContent = length + ' / 1000 characters';

        // Check if exceeds limit and show warning
        if (length > 1000) {
            wordCount.style.color = 'red'; // Change color to indicate exceeding limit
            warningMessage.style.display = 'block';
        } else {
            wordCount.style.color = '#666'; // Reset color if within limit
            warningMessage.style.display = 'none';
        }
    });
});


document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('createDiscussionForm');
    const titleInput = document.getElementById('title');
    const contentTextarea = document.getElementById('content');
    const submitBtn = document.querySelector('.create-form button[type="submit"]');
    const maxContentWords = 1000;

    // Function to update character count and validate form
    function updateCharacterCount() {
        const content = contentTextarea.value.trim();
        const contentWords = content.split(/\s+/).length;

        if (contentWords > maxContentWords) {
            submitBtn.disabled = true;
            contentTextarea.classList.add('invalid');
            alert('Your message is too long.');
        } else {
            submitBtn.disabled = false;
            contentTextarea.classList.remove('invalid');
        }
    }

    // Event listeners for input validation
    titleInput.addEventListener('input', function() {
        if (!titleInput.value.trim()) {
            submitBtn.disabled = true;
        } else {
            submitBtn.disabled = false;
        }
    });

    contentTextarea.addEventListener('input', function() {
        updateCharacterCount();
    });

    // Initial check on load
    updateCharacterCount();

    // Submit form handler (optional, for additional checks)
    form.addEventListener('submit', function(event) {
        const titleValid = !!titleInput.value.trim();
        const contentValid = contentTextarea.value.trim().split(/\s+/).length <= maxContentWords;

        if (!titleValid || !contentValid) {
            event.preventDefault();
            alert('Please fill out all required fields correctly.');
            // You can also display specific error messages next to each field
        }
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('createDiscussionForm');
    const contentInput = document.getElementById('content');
    const wordCount = document.getElementById('wordCount');
    const warningMessage = document.getElementById('warningMessage');
    const submitBtn = document.getElementById('submitBtn');

    contentInput.addEventListener('input', function() {
        const content = this.value;
        const length = content.length;
        wordCount.textContent = length + ' / 1000 characters';

        // Check if exceeds limit and show warning
        if (length > 1000) {
            wordCount.style.color = 'red'; // Change color to indicate exceeding limit
            warningMessage.style.display = 'block';
            submitBtn.disabled = true; // Disable submit button
        } else {
            wordCount.style.color = '#666'; // Reset color if within limit
            warningMessage.style.display = 'none';
            submitBtn.disabled = false; // Enable submit button
        }
    });
});


</script>



</body>
</html>
