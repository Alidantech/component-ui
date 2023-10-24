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
            $joinConditions[] = "students.student_id = $table.student_id";
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
    $joinQuery .= " WHERE students.first_name LIKE '%$keyword%' OR students.last_name LIKE '%$keyword%'";

    return $joinQuery;
}
?>

