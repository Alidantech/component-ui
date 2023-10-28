<?php
function createJoinQuery($jsonData, $keyword) {
    $tables = $jsonData;

    $queries = [];
    $joinConditions = [];

    foreach ($tables as $table => $columns) {
        // Construct a SELECT query for each table
        $selectQuery = "SELECT " . implode(", ", $columns) . " FROM " . $table;
        $queries[] = $selectQuery;

        // Define join conditions, assuming a common column like "StudentID" exists in the tables
        if ($table !== "students") {
            $joinConditions[] = "students.studentID = $table.studentID";
        }
    }

    // Create a single SQL query that joins the tables using the defined conditions and includes a WHERE clause
    $joinQuery = "SELECT " . implode(", ", $columns) . " FROM students";
    foreach ($tables as $table => $columns) {
        if ($table !== "students") {
            $joinQuery .= " JOIN $table ON " . implode(" AND ", $joinConditions);
        }
    }
    
    // Add a WHERE clause to search for the keyword in FirstName or LastName
    $joinQuery .= " WHERE students.FirstName LIKE '%$keyword%' OR students.LastName LIKE '%$keyword%'";

    return $joinQuery;
}
?>

