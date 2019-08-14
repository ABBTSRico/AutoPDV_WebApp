<?php

session_start();
require_once("../TableContent/tableLayout.php");

class ConstructionLayout {

    //HTML Header - eventuell in globalem File
    public static function getHeader() {
        $header = '
            <!DOCTYPE html>
                <html lang="en">
                    <head>
                        <meta charset="utf-8">
                        <title>EWZ - AutoPDV</title>
                        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
						<link rel="stylesheet" href="constrLayout.css">
						<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
						<script type0"text/javascript" language="javascript" src="../../Include/js/tableCtrl.js"></script>
					</head>
                    <body>
                    ';
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
                    	<a class="btn btn-primary btn-block" href="#" role="button">Anlage ändern</a>
                    	<a class="btn btn-primary btn-block" href="#" role="button">Anlage erfassen</a>
                    	<a class="btn btn-primary btn-block" href="#" role="button">Zurück</a>
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