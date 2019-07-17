<?php

//Session prüfen
session_start();
if(!isset($_SESSION["constructionEngineer"])) {
    die('Sie sind nicht korrekt <a href="../index.php">angemeldet</a>');
}

require_once("constrLayout.php");

$constructionLayout = new ConstructionLayout();

$header = $constructionLayout->getHeader();

$pageHeader = $constructionLayout->getPageHeader();

$pageContent = $constructionLayout->getPageContent();

$pageFooter = $constructionLayout->getPageFooter();

echo $header;

echo $pageHeader;

echo $pageContent;

echo $pageFooter;



//echo "Anlagebewirtschafter";


?>
