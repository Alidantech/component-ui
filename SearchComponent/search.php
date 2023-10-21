<?php
require_once 'database/database.php';

class Search {
    private $db;

    public function setDatabaseConfig($configFile) {
        include $configFile;
        $this->db = new Database($db_host, $db_user, $db_password, $db_name);
    }

    public function search() {

        try {
            // $results = $this->db->query("SELECT * FROM Person WHERE Person LIKE 'john'");
            // return $results;
            echo "done well";
        } catch (Exception $e) {
            return "Error: " . $e->getMessage();
        }
    }
}
