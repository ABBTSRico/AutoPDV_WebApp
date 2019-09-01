<?php

require_once("../../Include/php/session.php");
Session::sessionCheckCE();

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

?>