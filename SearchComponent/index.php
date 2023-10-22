<?php 
require_once 'search.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Read the JSON request body
    $request = json_decode(file_get_contents('php://input'), true);

    if (isset($request['keyword'])) {

        $keyword = $request['keyword'];

        // Send JSON data to the JavaScript file
        header('Content-Type: application/json');
        echo SearchQuery($keyword);
        
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Keyword is missing']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}

function SearchQuery($keyword) {

    $seachComponent = new Search();

    $seachComponent->setDatabaseConfig('config/config.php');
        
    $response = $seachComponent->search($keyword);

    if ($response) {
        // Fetch and format the results as JSON
        $result = $response->fetchAll(PDO::FETCH_ASSOC);
        $jsonResult = json_encode($result);

        return $jsonResult;

    } else {
        // Handle the case where the query fails
        die("PDO query failed: " . $this->connection->errorInfo());
    }
}


?>
