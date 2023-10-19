class Database {
    private $connection;

    public function __construct($host, $user, $password, $database) {
        // Initialize database connection
        $this->connection = new mysqli($host, $user, $password, $database);
    }

    public function query($sql) {
        // Execute a database query
        $result = $this->connection->query($sql);
        // Handle errors and return results
        return $result;
    }
}
