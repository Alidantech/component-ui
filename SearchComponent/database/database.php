<?php

class Database {
    private $connection;

    public function __construct($host, $user, $password, $database) {
        $this->tryMysqliConnection($host, $user, $password, $database);
    }

    private function tryMysqliConnection($host, $user, $password, $database) {
        $this->connection = new mysqli($host, $user, $password, $database);
        if ($this->connection->connect_error) {
            die("Mysqli connection failed: " . $this->connection->connect_error);
        }
    }

    public function query($sql) {
        if ($this->connection instanceof mysqli) {
            // Use mysqli for queries
            $result = $this->connection->query($sql);
            if ($result === false) {
                die("Mysqli query failed: " . $this->connection->error);
            }
            return $result;
        } else {
            die("No valid database connection available for query");
        }
    }
}
