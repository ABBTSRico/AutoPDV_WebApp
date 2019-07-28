<?php

require_once("constrLayout.php");

$constructionLayout = new ConstructionLayout();

$header = $constructionLayout->getHeader();

$pageHeader = $constructionLayout->getPageHeader();

$pageContent = $constructionLayout->getPageContent();

$pageFooter = $constructionLayout->getPageFooter();

echo $header;

//Session prüfen
session_start();
if(!isset($_SESSION["constructionEngineer"])) {
    session_destroy();
    die('<p class="SessionErrorText">Sie sind nicht korrekt angemeldet!</p><a class="SessionErrorLink" href="../index.php">->Zur Login Page</a>');
}

echo $pageHeader;

echo $pageContent;

echo $pageFooter;

//echo "Anlagebewirtschafter";

?>
