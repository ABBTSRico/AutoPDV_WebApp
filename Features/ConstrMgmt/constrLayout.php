<?php

session_start();
require_once("../../Include/php/Database.php");

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
		$constructionLayout = new ConstructionLayout();
		$pageContent = '
			<div id="c2" class="container-fluid text-center">
  				<div class="row content">
                    <div class="col-md-2 sidenav">
                    	<a class="btn btn-primary btn-block" href="#" role="button">Anlage ändern</a>
                    	<a class="btn btn-primary btn-block" href="#" role="button">Anlage erfassen</a>
                    	<a class="btn btn-primary btn-block" href="#" role="button">Zurück</a>
					</div>
					'.$constructionLayout->getTableContent().'
    				<div class="col-md-2 sidenav">
						<a class="btn btn-danger btn-block" href="../../Include/php/logout.php" role="button">logout</a>
    				</div>
  				</div>
			</div>
		';
		return $pageContent;
	}

	//Tabelleninhalte
	public function getTableContent(){

		$dataBase = new Database($_SESSION["userName"],$_SESSION["password"]);

		$tableContent= '
			<table id="table1" class="table col-md-8 table-condensed table-bordered table-sm">
				<thead>
					<tr>
						<th>AKS_Bezeichnung</th><th>Anlagename</th><th>Kurzzeichen</th><th>Verteilnetz</th><th>Bezeichnung</th>
					<tr>
				</thead>
				<body>
		';
				
		$sql="SELECT * FROM view_getStations ORDER BY AKS_Bezeichnung ASC;";
		$dataBase->Query($sql);
        $rows=$dataBase->Rows();                  

        foreach($rows as $row){
        	$tableContent .= "<tr>";
            $tableContent .= "<td>".$row["AKS_Bezeichnung"]."</td>";
            $tableContent .= "<td>".$row["Anlagename"]."</td>";
            $tableContent .= "<td>".$row["Kurzzeichen"]."</td>";
            $tableContent .= "<td>".$row["Verteilnetz"]."</td>";
            $tableContent .= "<td>".$row["Bezeichnung"]."</td>";
            $tableContent .= "</tr>";
		}
						
		$tableContent .= '
				</body>
			</table>
		';
		return $tableContent;
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