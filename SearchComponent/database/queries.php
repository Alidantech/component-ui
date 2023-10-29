<?php

function createQuery($tables, $keyword) {
    // Parse the JSON data into a PHP array
    $data = $tables;
    if ($data === null) {
        return "Invalid JSON data";
    }

    // Determine the number of tables in the JSON data
    $numTables = count($data['tables']);

    if ($numTables > 1) {
        // If there are multiple tables, find common columns
        $commonColumns = findCommonColumns($data['tables']);

        // Initialize arrays to store unique columns and tables
        $uniqueColumns = [];
        $uniqueTables = [];

        // Build the JOIN query
        $selectColumns = [];

        foreach ($data['tables'] as $table => $tableColumns) {
            foreach ($tableColumns as $column) {
                $uniqueColumnKey = "$table.$column";
                if (!isset($uniqueColumns[$uniqueColumnKey])) {
                    $selectColumns[] = $uniqueColumnKey;
                    $uniqueColumns[$uniqueColumnKey] = true;
                }
            }
            $uniqueTables[$table] = true;
        }

        $joinQuery = "SELECT " . implode(', ', $selectColumns) . " FROM " . implode(' JOIN ', array_keys($uniqueTables)) . " WHERE ";
        
        // Initialize an array to store conditions for each column
        $conditions = [];

        // Add conditions for the join query using the LIKE operator
        foreach ($uniqueTables as $table => $_) {
            foreach ($data['tables'][$table] as $column) {
                $conditions[] = "$table.$column LIKE '%$keyword%'";
            }
        }

        $joinQuery .= implode(' OR ', $conditions);

        return $joinQuery;
    } elseif ($numTables === 1) {
        // If there is only one table, create a normal query
        $table = key($data['tables']);
        $columns = $data['tables'][$table];

        // Initialize an array to store conditions for each column
        $conditions = [];

        // Loop through columns and create a condition for each one using the LIKE operator
        foreach ($columns as $column) {
            $conditions[] = "$column LIKE '%$keyword%'";
        }

        // Combine conditions using "OR" to search for the keyword in any column
        $query = "SELECT " . implode(', ', $columns) . " FROM $table WHERE " . implode(' OR ', $conditions);

        return $query;
    }

    return "No tables found in JSON data"; // Handle the case when no tables are found
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
