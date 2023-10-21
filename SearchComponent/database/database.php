<?php

class Database {
    private $connection;

    public function __construct($host, $user, $password, $database) {
        if ($this->tryPDOConnection($host, $user, $password, $database)) {
            echo "Connected using PDO";
        } elseif ($this->tryMySQLiConnection($host, $user, $password, $database)) {
            echo "Connected using MySQLi";
        } else {
            die("Database connection failed: Unable to connect using PDO or MySQLi");
        }
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

    private function tryMySQLiConnection($host, $user, $password, $database) {
        $mysqli = new mysqli($host, $user, $password, $database);
        if ($mysqli->connect_error) {
            return false; # MySQLi connection failed
        }

        $this->connection = $mysqli;
        return true; # Successful MySQLi connection
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
        } elseif ($this->connection instanceof mysqli) {
            // Use MySQLi for queries
            $result = $this->connection->query($sql);
            if (!$result) {
                die("MySQLi query failed: " . $this->connection->error);
            }
            return $result;
        } else {
            die("No valid database connection available for query");
        }
    }
}
