<?php

require_once("userLayout.php");

$userManagementLayout = new UserManagementLayout();

$header = $userManagementLayout->getHeader();

$pageHeader = $userManagementLayout->getPageHeader();

$pageContent = $userManagementLayout->getPageContent();

$pageFooter = $userManagementLayout->getPageFooter();

echo $header;

//Session prüfen
session_start();
if(!isset($_SESSION["userManager"])) {
    session_destroy();
    die('<p class="SessionErrorText">Sie sind nicht korrekt angemeldet!</p><a class="SessionErrorLink" href="../index.php">->Zur Login Page</a>');
}

echo $pageHeader;

echo $pageContent;

echo $pageFooter;

//echo "Anlagebewirtschafter";

?>
