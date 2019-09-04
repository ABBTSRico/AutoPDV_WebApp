<?php

class HtmlLayout {

	//HTML Header - eventuell in globalem File
	public static function getHeader() {
		$header = '
			<!DOCTYPE html>
				<html lang="en">
					<head>
						<meta charset="utf-8">
						<title>EWZ - AutoPDV</title>
						<link rel="stylesheet" href="../Include/css/indexLayout.css">
						<link rel="stylesheet" href="../Include/bootstrap-4.3.1-dist/css/bootstrap.min.css"
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
						<img src="../Include/img/012438_ewz-Logo_.png" alt="logo" width="100%" height="auto"/>   <!-- Responsive Layout -->
					</div>
				<div class="col-md-8 align-self-center">    <!-- align-self-center damit h1 vertikal in der Mitte ist -->
					<h1>AutoPDV</h1>
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
	public function getPageContent($status) {
		if ($status == "ok"){
			$Message =""; 
		}
		else if($status == "miss"){
			$Message ="Fehlende Eingabe in Benutzername <br/> und / oder Passwort"; 
		}
		else if($status == "conn"){
			$Message ="Verbindung zu Datenbank nicht möglich"; 
		}
		else if($status == "val"){
			$Message ="Ungültige Eingabe bei Benutzername oder Passwort"; 
		}
		else if($status == "cred"){
			$Message ="Falscher Benutzername oder Passwort"; 
		}
		else if($status == "role"){
			$Message ="Mit Ihrer Rolle haben Sie keine Berechtigung für diese Applikation"; 
		}
		else if($status == "logout"){
			$Message ="Logout - Vorgang abgeschlossen"; 
		}
		$pageContent = '
			<div id="c2" class="container-fluid text-center">
  				<div class="row content">
    				<div class="col-md-2 sidenav">
    					<form action="../Include/php/login.php" method="post">
            				<fieldset>
                				<legend>Login</legend>
                				Benutzername:<br/>
                				<input type="text" id="iUser" name="benutzername" placeholder="Benutzername"><br/>
                				Passwort:<br/>
                				<input type="password" id="iPassword" name="password" placeholder="Passwort"><br/>
                				<br/>
                				<button type="submit" id=bLogin>Login</button>
							</fieldset>
						</form>
						<br/>
						<p id="ErrorMessage">'.$Message.'</p>
    				</div>
    				<div id="Background" class="col-md-8 text-left"> 
						<img src="../Include/img/IMG_20181218_134236.jpg" alt="hintergrundbild" width="100%" height="100%"/>   <!-- Responsive Layout -->
				    </div>
    				<div class="col-md-2 sidenav">
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