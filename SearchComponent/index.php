<?php 
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Read the JSON request body
    $request = json_decode(file_get_contents('php://input'), true);

    if (isset($request['keyword'])) {
        $keyword = $request['keyword'];

        // You should handle the keyword and return a JSON response here
        // For the sake of this example, we'll return a sample JSON response
        $response = [
            'status' => 'success',
            'data' => "You searched for: $keyword",
        ];

        echo json_encode($response);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Keyword is missing']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
// require_once 'search.php';

// $seachComponent = new Search();

// $seachComponent->setDatabaseConfig('config/config.php');
// $response = $seachComponent->search("Mary");

// if ($response) {
//     // Fetch and format the results as JSON
//     $result = $response->fetchAll(PDO::FETCH_ASSOC);
//     $jsonResult = json_encode($result);

//     // Send JSON data to the JavaScript file
//     header('Content-Type: application/json');
//     echo $jsonResult;
// } else {
//     // Handle the case where the query fails
//     die("PDO query failed: " . $this->connection->errorInfo());
// }
// ?>
