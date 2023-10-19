<?php
require_once 'SearchComponent.php';

$searchComponent = new SearchComponent();

// Set the database configuration
$searchComponent->setDatabaseConfig('config/db-config.php');

// Use the search method
$results = $searchComponent->search('search term');
