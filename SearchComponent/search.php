<?php
require_once 'database/database.php';

class Search {
    private $db;

    public function setDatabaseConfig($configFile) {
        include $configFile;
        $this->db = new Database($db_host, $db_user, $db_password, $db_name);
    }

    public function search($queryKeyword) {

        echo "searching for:".$queryKeyword;

        $result = "No result";
        try {
            $sql = "SELECT * FROM students
                    WHERE first_name LIKE '%$queryKeyword%';
                    ";
            $result = $this->db->query($sql);
        } catch (Exception $e) {
            return "Error: " . $e->getMessage();
        }
        return $result;
    }
}
