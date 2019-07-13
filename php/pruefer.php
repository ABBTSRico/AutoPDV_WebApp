<?php

//Session prüfen
session_start();
if(!isset($_SESSION["tester"])) {
    die('Sie sind nicht korrekt <a href="../index.php">angemeldet</a>');
}

require_once("prueferLayout.php");

$testerLayout = new TesterLayout();

$header = $testerLayout->getHeader();

$pageHeader = $testerLayout->getPageHeader();

$pageContent = $testerLayout->getPageContent();

$pageFooter = $testerLayout->getPageFooter();

echo $header;

echo $pageHeader;

echo $pageContent;

echo $pageFooter;

?>
