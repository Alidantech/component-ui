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

    $searchComponent = new Search();
    $searchComponent->setDatabaseConfig('config/config.php');

    // Assuming the search method in the Search class returns the mysqli result object
    $result = $searchComponent->search("a");

    if ($result) {
        // Check if there are rows in the result set
        if ($result->num_rows > 0) {
            echo "\nStudent records:\n";

            // Loop through the result set and fetch data
            while ($row = $result->fetch_assoc()) {
                echo "Student ID: " . $row['StudentID'] . "";
                echo " " . $row['FirstName'] . " ".$row['LastName']." ".$row['DateOfBirth'];
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
