<?php

require_once("database.php");

class ReloadDB{
    public static function initTables($mysql_username,$mysql_password){

        // MySQL host
        $mysql_host = 'abbtsdb';
        // Database name
        $mysql_database = 'Anlagedaten';

        // Connect to MySQL server
        $con = @new mysqli($mysql_host,$mysql_username,$mysql_password,$mysql_database);

        // Check connection
        if ($con->connect_errno) {
            echo "Failed to connect to MySQL: " . $con->connect_errno;
            echo "<br/>Error: " . $con->connect_error;
        }

        $tables=file('../txt/tables.txt');
        $days=array('Mon'=>'Mo','Tue'=>'Di','Wed'=>'Mi','Thu'=>'Do','Fri'=>'Fr','Sat'=>'Sa','Sun'=>'So');
        $day=$days[date('D')];

        //Alle Tabelen in umgekehrter Reihenfolge leeren
        foreach (array_reverse($tables) as $table) {
            $con->query('DELETE FROM '.$table.';');
        }

        //BackUps in Tabellen schreiben
        foreach ($tables as $table) {
            $file_path='/var/lib/mysql/autopdv/BackUp/'.$day.'/'.trim($table).'.csv';
            $sql='LOAD DATA INFILE "'.$file_path.'" INTO TABLE '.$table.' FIELDS TERMINATED BY ";" LINES TERMINATED BY "\n";';
            $con->query($sql);
        }
        $con->close();
    }
}

if(isset($_GET['initDB'])){
    // Name of the file
    $filename = '../sql/InitDB.sql';
    // MySQL host
    $mysql_host = 'abbtsdb';
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
            $con->query(str_replace("$$;","",$templine)) or print('Error performing query \'<strong>' . $templine . '\': ' . $con->error() . '<br /><br />');
            // Reset temp variable to empty
            $templine = '';
        }
    }
    $con->close();
    ReloadDB::initTables($mysql_username,$mysql_password);
    header("location: ../../Features/index.php");
}

if(isset($_GET['InitTables'])){
    print_r($_SESSION);
    //ReloadDB::initTables($_SESSION['userName'],$_SESSION['password']);
};

?>