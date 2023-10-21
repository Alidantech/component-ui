<?php

// Database connection settings
$servername = "localhost";
$username = "your_db_user";
$password = "your_db_password";
$dbname = "your_db_name";

// Create a database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to execute SQL from a file
function executeSQLFromFile($conn, $sqlFile) {
    $sql = file_get_contents($sqlFile);

    if ($conn->multi_query($sql)) {
        do {
            if ($result = $conn->store_result()) {
                $result->free();
            }
        } while ($conn->more_results() && $conn->next_result());
    }

    return true;
}

// Run SQL files
$success = true;
$directory = 'migrations/'; // Directory where your SQL files are located

$files = glob($directory . '*.sql');

if (empty($files)) {
    echo "No SQL files found in the directory.";
} else {
    foreach ($files as $sqlFile) {
        if (executeSQLFromFile($conn, $sqlFile)) {
            echo "Executed SQL from file: $sqlFile\n";
        } else {
            echo "Error executing SQL from file: $sqlFile\n";
            $success = false;
        }
    }
}

// Close the database connection
$conn->close();

if ($success) {
    echo "All SQL files executed successfully.";
} else {
    echo "There were errors while executing SQL files.";
}
