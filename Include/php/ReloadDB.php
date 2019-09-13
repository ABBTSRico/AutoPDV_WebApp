<?php

require_once("database.php");

if(isset($_GET['initDB'])){
    // Name of the file
    $filename = '../sql/InitDB.sql';
    // MySQL host
    $mysql_host = 'localhost';
    // MySQL username
    $mysql_username = $_GET["benutzername"];
    // MySQL password
    $mysql_password = $_GET["password"];

    // Connect to MySQL server
    $con = @new mysqli($mysql_host,$mysql_username,$mysql_password);

    // Check connection
    if ($con->connect_errno) {
        echo "Failed to connect to MySQL: " . $con->connect_errno;
        echo "<br/>Error: " . $con->connect_error;
    }

    // Temporary variable, used to store current query
    $templine = '';
    // Read in entire file
    $lines = file($filename);

    // Setzte Standarddelimiter
    $delimiter = ";";
    // Loop through each line
    foreach ($lines as $line) {
    // Skip it if it's a comment
        if (substr($line, 0, 2) == '--' || $line == '')
            continue;

        if (strpos(trim($line), "DELIMITER")!==false){
            $delimiter = trim(substr(trim($line),10,3));
            continue;
        }

    // Add this line to the current segment
        $templine .= $line.' ';
    // If it has a semicolon at the end, it's the end of the query
        if ((substr(trim($line), -3, 3) == $delimiter) || substr(trim($line), -1, 1) == $delimiter) {
            // Perform the query
            $con->query(str_replace("$$;","",$templine));
            // Reset temp variable to empty
            $templine = '';
        }
    }
    $con->close();
    header("location: ../../Features/index.php");
}
?>