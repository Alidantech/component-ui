<?php

$json_data = '
{
  "tables": {
     
     "students": ["StudentID", "FirstName", "LastName"],
     "grades": ["StudentID", "grade", "score"]
  }
}
';

$keyword = "John";

function createQueries($json_data, $keyword) {
    // Parse the JSON data into a PHP array
    $data = json_decode($json_data, true);

    if ($data === null) {
        return "Invalid JSON data";
    }

    // Initialize an array to store the generated queries
    $queries = [];

    // Determine the number of tables in the JSON data
    $numTables = count($data['tables']);

    if ($numTables > 1) {
        // If there are multiple tables, find common columns
        $commonColumns = findCommonColumns($data['tables']);

        // Create a SELECT query that selects all columns from each table
        $selectColumns = [];
        foreach ($data['tables'] as $table => $tableColumns) {
            foreach ($tableColumns as $column) {
                $selectColumns[] = "$table.$column";
            }
        }

        // Add common columns to the select columns array with table alias
        foreach ($commonColumns as $column => $tables) {
            foreach ($tables as $table) {
                $selectColumns[] = "$table.$column";
            }
        }

        // Build the JOIN query
        $joinQuery = "SELECT " . implode(', ', $selectColumns) . " FROM " . implode(' JOIN ', array_keys($data['tables'])) . " WHERE ";
        
        // Initialize an array to store conditions for each column
        $conditions = [];

        // Add conditions for the join query
        foreach (array_keys($data['tables']) as $table) {
            $conditions[] = "$table.FirstName = '$keyword'";
        }

        $joinQuery .= implode(' OR ', $conditions);

        // Store the join query in the $queries array
        $queries[] = $joinQuery;
    } elseif ($numTables === 1) {
        // If there is only one table, create a normal query
        $table = key($data['tables']);
        $columns = $data['tables'][$table];

        $query = "SELECT " . implode(', ', $columns) . " FROM $table WHERE ";
        
        // Initialize an array to store conditions for each column
        $conditions = [];

        // Loop through columns and create a condition for each one
        foreach ($columns as $column) {
            $conditions[] = "$column = '$keyword'";
        }

        // Combine conditions using "OR" to search for the keyword in any column
        $query .= implode(' OR ', $conditions);
        
        // Store the query in the $queries array
        $queries[] = $query;
    }

    return $queries;
}




// Call the function and get the queries
$queries = createQueries($json_data, $keyword);

if (is_array($queries)) {
    // Display the generated queries
    foreach ($queries as $query) {
        echo "Query: $query\n";
    }
} else {
    echo $queries;
}

function findCommonColumns($tables) {
    if (count($tables) < 2) {
        return array();
    }

    $commonColumns = array();

    // Iterate through the columns of the first table to check for commonality
    $firstTable = key($tables); // Get the table name of the first table
    $firstTableColumns = reset($tables);

    foreach ($firstTableColumns as $column) {
        $isCommon = true;

        // Check if the column exists in all tables and record the table names
        $tableNames = array($firstTable); // Include the first table
        foreach ($tables as $tableName => $tableColumns) {
            if (!in_array($column, $tableColumns)) {
                $isCommon = false;
                break;
            } else {
                $tableNames[] = $tableName;
            }
        }

        if ($isCommon) {
            // Store the common column with its corresponding table names
            $commonColumns[$column] = $tableNames;
        }
    }

    return $commonColumns;
}
