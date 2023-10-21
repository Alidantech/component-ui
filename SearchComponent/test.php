<?php
require_once 'search.php';

$host = 'localhost';
$user = 'root';
$password = '';
$database = 'school';

$mysqli = new mysqli($host, $user, $password, $database);

if ($mysqli->connect_error) {
    echo "Connection failed: " . $mysqli->connect_error;
} else {
    echo "Connected successfully";

    // Select all records from the "student" table
    $query = "SELECT * FROM students";
    $result = $mysqli->query($query);

    if ($result) {
        // Check if there are rows in the result set
        if ($result->num_rows > 0) {
            echo "\nStudent records:\n";

            // Loop through the result set and fetch data
            while ($row = $result->fetch_assoc()) {
                echo "Student ID: " . $row['student_id'] . "";
                echo " " . $row['first_name'] . " ".$row['last_name']." ".$row['birthdate'];
                // Add more fields as needed
                echo "\n";
            }
        } else {
            echo "No student records found.";
        }

        // Free the result set
        $result->free();
    } else {
        echo "Error executing the query: " . $mysqli->error;
    }

    // Close the database connection
    $mysqli->close();
}
?>
