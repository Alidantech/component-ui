<?php
require_once 'database/database.php';
require_once 'database/queries.php';

class Search {
    private $db;

    public function setDatabaseConfig($configFile) {
        include $configFile;
        $this->db = new Database($db_host, $db_user, $db_password, $db_name);
    }

    public function search($queryKeyword, $tables) {
        $result = [];

        try {
            $sql = createJoinQuery($tables, $queryKeyword);
            $result = $this->db->query($sql);
        } catch (Exception $e) {
            return "Error: " . $e->getMessage();
        }

        return $result;
    }
}
