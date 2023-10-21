<?php

class Database {
    private $connection;

    public function __construct($host, $user, $password, $database) {
        try {
            // Initialize database connection
            $this->connection = new PDO("mysql:host=$host;dbname=$database", $user, $password);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Database connection failed: " . $e->getMessage()."\n");
        }
    }

    public function query($sql) {
        try {
            // Execute a database query
            $statement = $this->connection->query($sql);
            // Handle errors and return results
            return $statement;
        } catch (PDOException $e) {
            die("Database query failed: " . $e->getMessage());
        }
    }
}
