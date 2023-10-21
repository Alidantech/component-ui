<?php
require_once 'search.php';

$response = array(); 
$searchTerm = "john";
echo  searchFunction();

function searchFunction() {

    $searchComponent = new Search();
    $searchComponent->setDatabaseConfig('config/config.php');
    echo  "The result is: ".$searchComponent->search();

    return $results;
}

?>


