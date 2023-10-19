<?php
require_once 'database/Database.php';

class Search {
    private $db;

    public function setDatabaseConfig($configFile) {
        include $configFile;
        $this->db = new Database($db_host, $db_user, $db_password, $db_name);
    }

    public function search($query) {
        // Implement your search logic using $this->db
        // For example:
        $results = $this->db->query("SELECT * FROM table WHERE column LIKE '%$query%'");
        return $results;
    }
}
