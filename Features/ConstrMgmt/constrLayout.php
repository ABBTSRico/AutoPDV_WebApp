<?php

require_once("../../Include/php/session.php");
Session::sessionCheckCE();

require_once("../TableContent/tableLayout.php");
require_once("../PopUp/popUp.php");
require_once("../Forms/form.php");

class ConstructionLayout {

    //HTML Header - eventuell in globalem File
    public static function getHeader() {
		$popUp = new PopUp($_GET["tableName"]);
        $header = '
            <!DOCTYPE html>
                <html lang="en">
                    <head>
                        <meta charset="utf-8">
                        <title>EWZ - AutoPDV</title>
                        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
						<link rel="stylesheet" href="constrLayout.css">
						<link rel="stylesheet" href="../TableContent/tableLayout.css">
						<link rel="stylesheet" href="../PopUp/popUp.css">
						<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
						<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
						<script type="text/javascript" language="javascript" src="../../Include/js/nav.js"></script>
					</head>
                    <body>
                    '.$popUp->getPopUp();
        return $header;
    }

	//Kopfzeile
	public static function getPageHeader() {
		$pageHeader = '
			<div class="row">
				<div class="col-md-12">
				</div>    
			</div>
	
			<div id="c1" class="container-fluid text-center">
				<div class="row">
					<div class="col-md-2">
						<img src="../../Include/img/012438_ewz-Logo_.png" alt="logo" width="100%" height="auto"/>   <!-- Responsive Layout -->
					</div>
				<div class="col-md-8 align-self-center">    <!-- align-self-center damit h1 vertikal in der Mitte ist -->
					<h1>Anlagebewirtschafter</h1>
				</div>
					<div class="col-md-2">
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="col-md-12">
				</div>    
			</div>
		';
		return $pageHeader;
	}

	//Seiteninhalt
	public function getPageContent(){
		$TableLayout = new TableLayout();
		$pageContent = '
			<div id="c2" class="container-fluid text-center">
  				<div class="row content">
                    <div class="col-md-2 sidenav">
                    	<a class="btn btn-primary btn-block" id="btn-edit" href="#" role="button">Element ändern</a>
                    	<a class="btn btn-primary btn-block" id="btn-append" href="#" role="button">Element erfassen</a>
                    	<a class="btn btn-primary btn-block" id="btn-back" href="#" value="Zur&uuml;ck" onClick="history.back()" role="button">Zurück</a>
					</div>
					'.$TableLayout->getTableContent($_GET["tableName"]).'
					<div class="col-md-2 sidenav">
						<a class="btn btn-danger btn-block" href="../../Include/php/logout.php" role="button">logout</a>
    				</div>
  				</div>
			</div>
		';
		return $pageContent;
	}

	//Fusszeile
	public static function getPageFooter() {
		$body = '
			<div class="row">
    			<div class="col-md-12">
    			</div>    
			</div>	
			</body>
			</html>
		';
		return $body;
	}
}

?>