<?php 
require_once 'search.php';

$seachComponent = new Search();

$seachComponent->setDatabaseConfig('config/config.php');
$response = $seachComponent->search("Mary");

if ($response) {
    // Fetch and format the results as JSON
    $result = $response->fetchAll(PDO::FETCH_ASSOC);
    $jsonResult = json_encode($result);

    // Send JSON data to the JavaScript file
    header('Content-Type: application/json');
    echo $jsonResult;
} else {
    // Handle the case where the query fails
    die("PDO query failed: " . $this->connection->errorInfo());
}
?>
