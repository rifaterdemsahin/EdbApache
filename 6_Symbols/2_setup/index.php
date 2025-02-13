<?php
$host = 'edb-service';  // The service name in Kubernetes
$port = '5444';  // Default EDB port
$dbname = 'demo_db';
$user = 'admin';
$pass = 'secretpassword';

// Connect to the EDB database
$connection = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$pass");

if (!$connection) {
    echo "Error: Unable to connect to the database.\n";
    exit;
}

// Query to get the metadata from EDB
$query = 'SELECT version(), current_database(), current_user;';
$result = pg_query($connection, $query);

if (!$result) {
    echo "An error occurred while executing the query.\n";
    exit;
}

// Display the metadata
echo "<h1>EnterpriseDB Metadata</h1>";
while ($row = pg_fetch_row($result)) {
    echo "<p>PostgreSQL Version: " . $row[0] . "</p>";
    echo "<p>Database: " . $row[1] . "</p>";
    echo "<p>User: " . $row[2] . "</p>";
}

pg_close($connection);
?>