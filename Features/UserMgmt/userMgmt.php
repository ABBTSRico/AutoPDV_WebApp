<?php

require_once("../../Include/php/session.php");
Session::sessionCheckUM();

require_once("userLayout.php");

$userManagementLayout = new UserManagementLayout();

$header = $userManagementLayout->getHeader();

$pageHeader = $userManagementLayout->getPageHeader();

$pageContent = $userManagementLayout->getPageContent();

$pageFooter = $userManagementLayout->getPageFooter();

echo $header;

echo $pageHeader;

echo $pageContent;

echo $pageFooter;

?>