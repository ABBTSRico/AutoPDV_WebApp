<?php

//Session prüfen
session_start();
if(!isset($_SESSION["userManagement"])) {
    die('Sie sind nicht korrekt <a href="../index.php">angemeldet</a>');
}

require_once("benutzerLayout.php");

$userManagementLayout = new UserManagementLayout();

$header = $userManagementLayout->getHeader();

$pageHeader = $userManagementLayout->getPageHeader();

$pageContent = $userManagementLayout->getPageContent();

$pageFooter = $userManagementLayout->getPageFooter();

echo $header;

echo $pageHeader;

echo $pageContent;

echo $pageFooter;



//echo "Anlagebewirtschafter";


?>
