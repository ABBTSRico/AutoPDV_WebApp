<?php
        
session_start();
session_destroy();

//Aufruf Startseite mit Logout Meldung
header("location: ../../Features/index.php?Logout=ok");
    
?>