
<?php

require_once("../Include/php/htmlLayout.php");

$htmlLayout = new HtmlLayout();

$header = $htmlLayout->getHeader();

$pageHeader = $htmlLayout->getPageHeader();

$pageFooter = $htmlLayout->getPageFooter();

if(isset($_GET["LoginError"]) && $_GET["LoginError"] == 'miss'){
    //Fehlende Eingabe in Benutzername und / oder Passwort
    $message="miss";
}
else if (isset($_GET["LoginError"]) && $_GET["LoginError"] == 'conn'){
    //Verbindung zu Datenbank nicht möglich
    $message="conn";
}
else if (isset($_GET["LoginError"]) && $_GET["LoginError"] == 'val'){
    //Eingabe Validierung fehlgeschlagen (DB Login)
    $message="val";
}
else if (isset($_GET["LoginError"]) && $_GET["LoginError"] == 'cred'){
    //Falscher Benutzername oder Passwort (DB Login)
    $message="cred";
}
else if (isset($_GET["LoginError"]) && $_GET["LoginError"] == 'role'){
    //Benutzer hat Rolle die keine Berechtigung für Web App hat
    $message="role";
}
else if(isset($_GET["Logout"]) && $_GET["Logout"] == 'ok'){
    //Logout
    $message="logout";
}
else {
    //Erstmaliges öffnen der Seite
    $message="ok";
}

$pageContent = $htmlLayout->getPageContent($message);

echo $header;

echo $pageHeader;

echo $pageContent;

echo $pageFooter;

?>