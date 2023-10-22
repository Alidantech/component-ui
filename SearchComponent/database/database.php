<?php

class Database {
    private $connection;

    public function __construct($host, $user, $password, $database) {
       $this->tryPDOConnection($host, $user, $password, $database);
    }

    private function tryPDOConnection($host, $user, $password, $database) {
        try {
            $this->connection = new PDO("mysql:host=$host;dbname=$database", $user, $password);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return true; # Successful PDO connection
        } catch (PDOException $e) {
            return false; # PDO connection failed
        }
    }

    public function query($sql) {
        if ($this->connection instanceof PDO) {
            // Use PDO for queries
            try {
                $statement = $this->connection->query($sql);
                // Handle errors and return results
                return $statement;
            } catch (PDOException $e) {
                die("PDO query failed: " . $e->getMessage());
            }
        }else {
            die("No valid database connection available for query");
        }
    }
}
