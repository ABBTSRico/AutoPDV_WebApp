
<?php
        
    session_start();
    session_destroy();
         
    echo "Logout erfolgreich";

    //Mit Meldung rechts dass abgemeldet
    header("location: ../index.php?Logout=ok");
    
?>
