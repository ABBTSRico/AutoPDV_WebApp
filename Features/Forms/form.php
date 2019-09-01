<?php

require_once("../../Include/php/session.php");
Session::sessionCheckGeneral();

require_once("../../Include/php/Database.php");
require_once("../../Include/php/timestamp.php");
require_once("../../Include/php/validation.php");
require_once("formEdit.php");
require_once("formAppend.php");

abstract class Form{
protected $database;
protected $sql;
protected $dbRow;

	function __construct(){
		$this->database = new Database($_SESSION["userName"],$_SESSION["password"]);
	}

	public abstract function load(string $sql);

	public abstract function show();

	public function showFormHeader(){
				
		return '
        <form id="form" method="POST" action="../Forms/form.php">
       		<input type="hidden" name="saveData" value=true>
        ';
	}

	public function showEmployee(){
        $this->database->Query("SELECT GrID AS ID, Gruppenname AS USERGROUP FROM BENUTZERGRUPPE");
		$this->userGroups = $this->database->Rows();
		$html='
            <div class="row">
                <div class="form-group col-md-4">
                    <label for="Kurzzeichen:">Kurzzeichen:</label><br/>
		';
			if(isset($_POST['edit'])){
				$html.='<input type="text" class="form-control" id="shortsign" readonly=true name="Kurzzeichen" value="'.$this->dbRow["Kurzzeichen"].'">';
			}else{
				$html.='<input type="text" class="form-control" id="shortsign" name="Kurzzeichen" value="'.$this->dbRow["Kurzzeichen"].'">';
			}
		$html .='
				</div>
		';
			if(isset($_POST['append'])){
			$html .='
                <div class="form-group col-md-6">
					<label for="Passwort:">Passwort:</label><br/>
					<input type="password" class="form-control" id="password" name="Passwort" placeholder="Passwort">
				</div>';
			}
		$html .='
            </div>					
            <div class="row">
                <div class="form-group col-md-6">
                    <input type="text" class="form-control" id="firstname" name="Vorname" placeholder="Vorname" value="'.$this->dbRow["Vorname"].'">
                </div>
                <div class="form-group col-md-6">
                    <input type="text" class="form-control" id="lastname" name="Nachname" placeholder="Nachname" value="'.$this->dbRow["Nachname"].'">
                </div>
            </div>
			<div class="row">
                <div class="form-group col-md-6">
                    <label for="Benutzergruppe:">Benutzergruppe:</label><br/>
                    <select id="userGroup" name="Benutzergruppe" class="form-control">
        ';
                        foreach($this->userGroups as $userGroup){
                            $selected = "";
                                if ($userGroup["ID"] == $this->dbRow["GrID"]){
                                    $selected = 'selected="selected"';
                                }
                        $html  .= '
                            <option value="'.$userGroup["ID"].'" '.$selected.'>'.$userGroup["USERGROUP"].'</option>
                        ';
                        }
        $html .='
                    </select>
				</div>
			</div>        
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btn-back" data-dismiss="modal">Abbrechen</Button>
				<input class="btn btn-primary" type="submit" value="Speichern">
		';
		return $html;
	}

	public function showStation(){
        $this->database->Query("SELECT VnID AS ID, AKS_Bezeichnung, Verteilnetzname AS NET FROM VERTEILNETZ");
		$this->distNets = $this->database->Rows();
        $this->database->Query("SELECT NeID AS ID, AKS_Bezeichnung, Bezeichnung AS NET FROM NETZEBENE");
		$this->netLvls = $this->database->Rows();
		
		$html='
            <div class="row">
                <div class="form-group col-md-4">
                    <label for="Verteilnetz:">Verteilnetz:</label><br/>
                    <select id="distNetwotk" name="Verteilnetz" class="form-control">
        ';
                        foreach($this->distNets as $distNet){
                            $selected = "";
                                if ($distNet["ID"] == $this->dbRow["VnID"]){
                                    $selected = 'selected="selected"';
                                }
                        $html  .= '
                            <option value="'.$distNet["ID"].'" '.$selected.'>'.$distNet["NET"].'</option>
                        ';
                        }
        $html .='
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="Netzebene:">Netzebene:</label><br/>
                    <select id="netLvl" name="Netzebene" class="form-control">
        ';
                        foreach($this->netLvls as $netLvl){
                            $selected = "";
                                if ($netLvl["ID"] == $this->dbRow["NeID"]){
                                    $selected = 'selected="selected"';
                            }
                            $html  .= '
                                <option value="'.$netLvl["ID"].'" '.$selected.'>'.$netLvl["NET"].'</option>
                            ';
                        }
        $html .='
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-4">
                    <input type="numeric" class="form-control" min=00001 max=99999 id="aks" name="AKS" placeholder="AKS-Bezeichnung" value="'.$this->dbRow["AKS_Bezeichnung"].'">
                </div>
                <div class="form-group col-md-3">
                    <input type="text" class="form-control" minlength=3 maxlength=3 id="shortsign" name="Kurzzeichen" placeholder="Kürzel" value="'.$this->dbRow["Kurzzeichen"].'">
                </div>
            </div>
            <div class="form-group">
            	<input type="text" class="form-control" id="station" name="Anlage" placeholder="Anlage" value="'.$this->dbRow["Anlagename"].'">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="address" name="Adresse" placeholder="Strasse" value="'.$this->dbRow["Adresse"].'">
            </div>
            <div class="row ">
                <div class="form-group col-md 2">
                    <input type="numeric" min=1000 max=9999 class="form-control" id="zip" name="PLZ" placeholder="PLZ" value="'.$this->dbRow["PLZ"].'">
                </div>
                <div class="form-group col-md-8">
                    <input type="text" class="form-control" id="city" name="Ort" placeholder="Ort" value="'.$this->dbRow["Ortsname"].'">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <input type="tel" max=999999999 class="form-control" id="tel" name="Tel" placeholder="Telefon" value="'.$this->dbRow["Telefon"].'">
                </div>
                <div class="form-group col-md-3">
                    <input type="text" class="form-control" id="year" name="Jahr" placeholder="Baujahr" value="'.$this->dbRow["Baujahr"].'">
                </div>
            </div>            
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btn-back" data-dismiss="modal">Abbrechen</Button>
                <input class="btn btn-primary" type="submit" value="Speichern">
		';
		return $html;
	}

	public function showInfOb(){
        $this->database->Query("SELECT AnID AS ID, AKS_Bezeichnung, Anlagename AS STA FROM ANLAGE");
		$this->stations = $this->database->Rows();
		$html='
            <div class="row">
                <div class="form-group col-md-8">
                    <label for="Anlage:">Anlage:</label><br/>
                    <input type="text" id="station" readonly=true name="Anlage" class="form-control "
        ';
                        foreach($this->stations as $station){
                            if ($station["ID"] == $_POST['parentID']){
								$html  .= '
                            		value="'.$station["STA"].'">
                        		';
                            }
                        }
		$html .='					
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-4">
                    <input type="numeric" class="form-control" min=00001 max=99999 id="aks" name="AKS" placeholder="AKS-Bezeichnung" value="'.$this->dbRow["AKS_Bezeichnung"].'">
                </div>
                <div class="form-group col-md-6">
                    <input type="text" class="form-control"id="infObj" name="InfObj" placeholder="Infrastrukturobjekt" value="'.$this->dbRow["Infrastrukturobjektbezeichnung"].'">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btn-back" data-dismiss="modal">Abbrechen</Button>
                <input class="btn btn-primary" type="submit" value="Speichern">
		';
		return $html;
	}
 
	public function showField(){
		$this->database->Query("SELECT InfObID AS ID, AKS_Bezeichnung, Infrastrukturobjektbezeichnung AS INFOB FROM INFRASTRUKTUROBJEKT");
		$this->infObjs = $this->database->Rows();
		$html='
			<div class="row">
				<div class="form-group col-md-8">
					<label for="InfObj:">Infrastrukturobjekt:</label><br/>
					<input type="text" id="infObj" readonly=true name="InfObj" class="form-control "
		';
		foreach($this->infObjs as $infObj){
			if ($infObj["ID"] == $_POST['parentID']){
				$html  .= '
					value="'.$infObj["INFOB"].'">
				';
			}
		}
		$html .='					
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<input type="numeric" class="form-control" min=00001 max=99999 id="aks" name="AKS" placeholder="AKS-Bezeichnung" value="'.$this->dbRow["AKS_Bezeichnung"].'">
				</div>
				<div class="form-group col-md-6">
					<input type="text" class="form-control"id="field" name="Feld" placeholder="Feld" value="'.$this->dbRow["Feldbezeichnung"].'">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn-back" data-dismiss="modal">Abbrechen</Button>
				<input class="btn btn-primary" type="submit" value="Speichern">
		';
		return $html;
	}

	public function showEquipmentEdit(){
		$this->database->Query("SELECT FeID AS ID, AKS_Bezeichnung AS AKS, Feldbezeichnung AS Feld FROM FELD;");
		$this->fields = $this->database->Rows();
		$this->database->Query("SELECT * FROM BETRIEBSMITTEL WHERE BETRIEBSMITTEL.BmID=".$this->dbRow["ID"].";");
		$this->equipments = $this->database->Rows()[0];
		$this->database->Query("SELECT * FROM view_getDevices WHERE AKS_Bezeichnung="."'".$this->equipments["AKS_Bezeichnung"]."' AND FilterID =".$this->dbRow["FilterID"].";");
		$this->devices = $this->database->Rows();
        $this->database->Query("SELECT FkID AS ID, Funktionsname  AS Funk FROM FUNKTION");
		$this->functions = $this->database->Rows();
		$this->database->Query("SELECT * FROM view_getTransformers;");
		$this->transformers = $this->database->Rows();
		$html='
			<div class="row">
				<div class="form-group col-md-6">
					<label for="Feld:">Feld:</label><br/>
					<input type="text" id="field" readonly=true name="Feld" class="form-control "
		';
		foreach($this->fields as $field){
			if ($field["ID"] == $_POST['parentID']){
				$html  .= '
					value="-'.$field["AKS"].' '.$field["Feld"].'">
				';
			}
		}
		$html.='					
				</div>
				<div class="form-group col-md-5">
					<label for="Funktion:">Funktion:</label><br/>
					<select id="func" name="Funktion" class="form-control">
		';
		foreach($this->functions as $function){
			$selected = "";
			if ($function["ID"] == $this->devices[0]["FkID"]){
				$selected = 'selected="selected"';
			}
			$html  .= '
				<option value="'.$function["ID"].'" '.$selected.'>'.$function["Funk"].'</option>
			';
		}
		$html .='
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<input type="numeric" class="form-control" min=00001 max=99999 id="aks" name="AKS" placeholder="AKS-Bezeichnung" value="'.$this->equipments["AKS_Bezeichnung"].'">
				</div>
			</div>					
		';
		for($i=1;$i<=3;$i++){
			switch($i){
				case 1 : $phase='R';
				break;
				case 2 : $phase='S';
				break;
				case 3 : $phase='T';
				break;
			}
			foreach($this->devices as $device){
				if ($device["Bezeichnung"] == $phase){
					$html  .= '
				<div class="row">
					<div class="form-group form-inline col-md-12">
						<lable for="PhaseL'.$i.'">Phase: </label>
						<input type="text" id="ph1" readonly=true name="PhaseL"'.$i.' class="form-control col-md-1" value="'.$phase.'">
						<input type="text" class="form-control col-md-8" id="serialNo'.$i.'" name="SerieNr'.$i.'" placeholder="SerieNr" value="'.$device["SerienNr"].'">
						<select id="partNo'.$i.$j.'" name="ArtikelNr'.$i.'" class="form-control col-md-4">
			';
						foreach($this->transformers as $transformer){
							$selected = "";
							if ($transformer["BmTID"] == $device["BmTID"]){
								$selected = 'selected="selected"';
							}
							$html  .= '
								<option value="'.$transformer["BmTID"].'" '.$selected.'>'.$transformer["ArtikelNr"].'</option>
							';
						}
				$html .='
						</select>
					</div>				
				</div>
				<div class="row">
					<div class="form-group col-md-6">
					<input type="numeric" class="form-control min=00000001 max=99999999 col-md-8" id="equipment'.$i.'" name="Equipment'.$i.'" placeholder="Equipment" value="'.$device["Equipment"].'">
					</div>
				</div>
					';
					$cores=array();
					foreach($this->devices as $device){
						if($device["Bezeichnung"] == $phase){
							$cores[] = $device;
						}
					}
					for($j=1;$j<=8;$j++){
						$core=$cores[$j-1];
						$coreNumber=$core["Kern"];
						$html .='
							<div class="row">
							<div class="form-group form-inline col-md-12">
								<lable for="Kern'.$i.$j.'">Kern: </label>
								<input type="numeric" id="core'.$i.$j.'" name="Kern'.$i.$j.'" class="form-control col-md-2" value="'.$coreNumber.'">
								<select id="coreDate'.$i.$j.'" name="Kerndaten'.$i.$j.'" class="form-control col-md-8">
						';
						$html .= $this->getCoreSelection($core, $i);	
						$html .='
									</select>
								</div>
							</div>
						';
					}
					break;
				}
				
			}
		}

	$html .='
		</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn-back" data-dismiss="modal">Abbrechen</Button>
				<input class="btn btn-primary" type="submit" value="Speichern">
		';
		return $html;
	}

	public function showEquipmentAppend(){
		$this->database->Query("SELECT FeID AS ID, AKS_Bezeichnung AS AKS, Feldbezeichnung AS Feld FROM FELD;");
		$this->fields = $this->database->Rows();
        $this->database->Query("SELECT FkID AS ID, Funktionsname  AS Funk FROM FUNKTION");
		$this->functions = $this->database->Rows();
		$this->database->Query("SELECT * FROM view_getTransformers;");
		$this->transformers = $this->database->Rows();
		$html='
			<div class="row">
				<div class="form-group col-md-6">
					<label for="Feld:">Feld:</label><br/>
					<input type="text" id="field" readonly=true name="Feld" class="form-control "
		';
		foreach($this->fields as $field){
			if ($field["ID"] == $_POST['parentID']){
				$html  .= '
					value="-'.$field["AKS"].' '.$field["Feld"].'">
				';
			}
		}
		$html.='					
				</div>
				<div class="form-group col-md-5">
					<label for="Funktion:">Funktion:</label><br/>
					<select id="func" name="Funktion" class="form-control">
		';
		foreach($this->functions as $function){
			$selected = "";
			if ($function["ID"] == $this->devices[0]["FkID"]){
				$selected = 'selected="selected"';
			}
			$html  .= '
				<option value="'.$function["ID"].'" '.$selected.'>'.$function["Funk"].'</option>
			';
		}
		$html .='
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<input type="numeric" class="form-control" min=00001 max=99999 id="aks" name="AKS" placeholder="AKS-Bezeichnung" value="'.$this->equipments["AKS_Bezeichnung"].'">
				</div>
			</div>					
		';
		for($i=1;$i<=3;$i++){
			switch($i){
				case 1 : $phase='R';
				break;
				case 2 : $phase='S';
				break;
				case 3 : $phase='T';
				break;
			}
					$html  .= '
				<div class="row">
					<div class="form-group form-inline col-md-12">
						<lable for="PhaseL'.$i.'">Phase: </label>
						<input type="text" id="ph1" readonly=true name="PhaseL'.$i.'" class="form-control col-md-1" value="'.$phase.'">
						<input type="text" class="form-control col-md-8" id="serialNo'.$i.'" name="SerieNr'.$i.'" placeholder="SerieNr" value="'.$device["SerienNr"].'">
						<select id="partNo'.$i.$j.'" name="ArtikelNr'.$i.'" class="form-control col-md-4">
			';
						foreach($this->transformers as $transformer){
							$selected = "";
							if ($transformer["BmTID"] == $device["BmTID"]){
								$selected = 'selected="selected"';
							}
							$html  .= '
								<option value="'.$transformer["BmTID"].'" '.$selected.'>'.$transformer["ArtikelNr"].'</option>
							';
						}
				$html .='
						</select>
					</div>				
				</div>
				<div class="row">
					<div class="form-group col-md-6">
					<input type="numeric" class="form-control min=00000001 max=99999999 col-md-8" id="equipment'.$i.'" name="Equipment'.$i.'" placeholder="Equipment" value="'.$device["Equipment"].'">
					</div>
				</div>
					';
					$cores=array();
					foreach($this->devices as $device){
						if($device["Bezeichnung"] == $phase){
							$cores[] = $device;
						}
					}
					for($j=1;$j<=8;$j++){
						$core=$cores[$j-1];
						$coreNumber=$core["Kern"];
						$html .='
							<div class="row">
							<div class="form-group form-inline col-md-12">
								<lable for="Kern'.$i.$j.'">Kern: </label>
								<input type="numeric" id="core'.$i.$j.'" name="Kern'.$i.$j.'" class="form-control col-md-2" value="'.$coreNumber.'">
								<select id="coreDate'.$i.$j.'" name="Kerndaten'.$i.$j.'" class="form-control col-md-8">
						';
						$html .= $this->getCoreSelection($core, $i);	
						$html .='
									</select>
								</div>
							</div>
						';
					}

		}

	$html .='
		</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn-back" data-dismiss="modal">Abbrechen</Button>
				<input class="btn btn-primary" type="submit" value="Speichern">
		';
		return $html;
	}

	protected function getElementToEdit($sql){
		$this->database->Query($sql);
		return $this->database->Rows()[0];
	}

	protected function getCoreSelection($device, $i){
		foreach($this->transformers as $transformer){
			$selected = "";
			if ($transformer["BmTID"] == $device["BmTID"]){
				$selected = 'selected="selected"';
			}
			if($transformer["ArtikelNr"] == $device["ArtikelNr"]){
				$html  .= '
					<option value="'.$transformer["BmTID"].'" '.$selected.'>'.$transformer["PrimWert"]."/".$transformer["SekWert"].$transformer["Einheitszeichen"]." ".
					$transformer["Buerde"]."VA ".$transformer["Name"].'</option>
				';
			}								
		}
		return $html;
	}
}

if(isset($_POST['saveData'])){
	$database = new Database($_SESSION['userName'],$_SESSION['password']);
	$validation = new Validation();
	switch($_POST['tableName']){
		case "MITARBEITER":
		if(isset($_POST['edit'])){
			$sql= 'CALL sps_mutateUser("'.$_POST["filterID"];
			$sql.='", "'.$_POST['Benutzergruppe'];
			$sql.='", "'.Timestamp::getDateTimeLocal();
			$sql.='", "'.$_SESSION['userName'].'");';
			$database->UpdateDb($sql);
			header("location: ../UserMgmt/UserMgmt.php?tableName=Mitarbeiter");
			
		}elseif(isset($_POST['append'])){
			$passwordError = $validation->checkPassword($_POST['Passwort']);
			if($passwordError=="ok"){				
				$database->Query('SELECT * FROM MITARBEITER WHERE Kurzzeichen="'.$_POST['Kurzzeichen'].'";');
				if($database->NumRows()==0){
					$database->UpdateDb('CREATE USER "'.$_POST['Kurzzeichen'].'" IDENTIFIED BY "'.$_POST['Passwort'].'";');
					$sql= 'CALL sps_addUser("'.$_POST["Benutzergruppe"];
					$sql.='", "'.$_POST['Vorname'];
					$sql.='", "'.$_POST['Nachname'];
					$sql.='", "'.$_POST['Kurzzeichen'];
					$sql.='", "'.$_POST['Passwort'];
					$sql.='", "'.Timestamp::getDateTimeLocal();
					$sql.='", "'.$_SESSION['userName'].'");';
					$database->UpdateDb($sql);
					header("location: ../UserMgmt/UserMgmt.php?tableName=Mitarbeiter");
				}else{
					echo '<script type="text/javascript" language="javascript">
						alert("Der Benutzer mit dem Kurzzeichen '.$_POST['Kurzzeichen'].' existiertbereits!!!");
					</script>';
				}
				
			}else{
				switch($passwordError){
					case "Blank":
						$msg = "Kein Eingebe!!!";
					break;
					case "Semicolon":
						$msg = "Das eingegebene Passwort enthält keine Sonderzeichen!!!";
					break;
					case "Length":
						$msg = "Das eingegebene Passwort muss zwischen 6 und 12 Zeichen enthalten!!!";
					break;
				}
				echo '<script type="text/javascript" language="javascript">
					alert("'.$msg.'");
				</script>';
			}
		}
		break;
		case "ANLAGE":
		$database->Query('SELECT OrtID FROM ORT WHERE PLZ="'.$_POST['PLZ'].'" AND Ortsname="'.$_POST['Ort'].'";');
		$location = $database->Rows()[0];
		if($database->NumRows()==0){
			$sql='INSERT INTO ORT VALUES (default,"'.$_POST['PLZ'].'", "'.$_POST['Ort'].'","CH");';
			$database->UpdateDb($sql);
			$database->Query('SELECT OrtID FROM ORT WHERE PLZ="'.$_POST['PLZ'].'" AND Ortsname="'.$_POST['Ort'].'";');
			$location = $database->Rows()[0];
		}
		if($_POST['Jahr']==null){
			$_POST['Jahr']=-1;
		}
		if(isset($_POST['edit'])){
			$sql='UPDATE '.$_POST['tableName'].' SET VnID="'.$_POST['Verteilnetz'];
			$sql.= '", NeID="'.$_POST['Netzebene'];
			$sql.='", AKS_Bezeichnung="'.$_POST['AKS'];
			$sql.='", Kurzzeichen="'.$_POST['Kurzzeichen'];
			$sql.='", Anlagename="'.$_POST['Anlage'];
			$sql.='", Adresse="'.$_POST['Adresse'];
			$sql.='", OrtID="'.$location['OrtID'];
			$sql.='", Telefon="'.$_POST['Tel'];
			$sql.='", Baujahr="'.$_POST['Jahr'];
			$sql.='", Datum="'.Timestamp::getDateTimeLocal();
			$sql.='", Visum="'.$_SESSION['userName'];
			$sql.='" WHERE AnID="'.$_POST['filterID'].'";';
			$database->UpdateDb($sql);
			
		}elseif(isset($_POST['append'])){
			$sql='INSERT INTO '.$_POST['tableName'].' VALUES (default, "'.$_POST['Verteilnetz'];
			$sql.='", "'.$_POST['Netzebene'];
			$sql.='", "'.$_POST['AKS'];
			$sql.='", "'.$_POST['Anlage'];
			$sql.='", "'.$_POST['Kurzzeichen'];
			$sql.='", "'.$_POST['Adresse'];
			$sql.='", "'.$location['OrtID'];
			$sql.='", "'.$_POST['Tel'];
			$sql.='", '.$_POST['Jahr'];
			$sql.='", 0';
			$sql.=', "'.Timestamp::getDateTimeLocal();
			$sql.='", "'.$_SESSION['userName'].'");';
			$database->UpdateDb($sql);
		}
		header("location: ../ConstrMgmt/constrMgmt.php?tableName=Anlage");
		break;
		case "INFRASTRUKTUROBJEKT":
		if(isset($_POST['edit'])){
			$sql='UPDATE '.$_POST['tableName'].' SET AKS_Bezeichnung="'.$_POST['AKS'];
			$sql.= '", Infrastrukturobjektbezeichnung="'.$_POST['InfObj'];
			$sql.='", Datum="'.Timestamp::getDateTimeLocal();
			$sql.='", Visum="'.$_SESSION['userName'];
			$sql.='" WHERE InfObID="'.$_POST['filterID'].'";';
			$database->UpdateDb($sql);
			
		}elseif(isset($_POST['append'])){
			$sql='INSERT INTO '.$_POST['tableName'].' VALUES (default, "'.$_POST['parentID'];
			$sql.='", "'.$_POST['AKS'];
			$sql.='", "'.$_POST['InfObj'];
			$sql.='", 0';
			$sql.=', "'.Timestamp::getDateTimeLocal();
			$sql.='", "'.$_SESSION['userName'].'");';
			$database->UpdateDb($sql);
		}
		
		header("location: ../ConstrMgmt/constrMgmt.php?tableName=InfObj&filter=".$_POST['parentID']);
		break;

		case "FELD":
		if(isset($_POST['edit'])){
			$sql='UPDATE '.$_POST['tableName'].' SET AKS_Bezeichnung="'.$_POST['AKS'];
			$sql.= '", Feldbezeichnung="'.$_POST['Feld'];
			$sql.='", Datum="'.Timestamp::getDateTimeLocal();
			$sql.='", Visum="'.$_SESSION['userName'];
			$sql.='" WHERE FeID="'.$_POST['filterID'].'";';
			$database->UpdateDb($sql);
			
		}elseif(isset($_POST['append'])){
			$sql='INSERT INTO '.$_POST['tableName'].' VALUES (default, "'.$_POST['parentID'];
			$sql.='", "'.$_POST['AKS'];
			$sql.='", "'.$_POST['Feld'];
			$sql.='", 0';
			$sql.=', "'.Timestamp::getDateTimeLocal();
			$sql.='", "'.$_SESSION['userName'].'");';
			printf($sql);
			$database->UpdateDb($sql);
		}
		
		case "BETRIEBSMITTEL":
	
		if(isset($_POST['edit'])){
			$database->Query("SELECT * FROM view_getEquipment WHERE AKS_Bezeichnung="."'".$_POST['filterID']."';");
			$equipments=$database->Rows();
				$i=1;
				foreach($equipments AS $equipment){
					$sql= 'UPDATE '.$_POST['tableName'].' SET AKS_Bezeichnung="'.$_POST['AKS'];
					$sql.= '", Equipment="'.$_POST['Equipment'.$i.''];
					$sql.= '", SerienNr="'.$_POST['SerieNr'.$i.''];
					$sql.='", Datum="'.Timestamp::getDateTimeLocal();
					$sql.='", Visum="'.$_SESSION['userName'];
					$sql.='" WHERE BmID="'.$equipment['ID'].'";';
					$database->UpdateDb($sql);
					$database->Query("SELECT * FROM view_getDevices WHERE ID=".$equipment["ID"].";");
					$devices = $database->Rows();
					$database->Query("SELECT * FROM view_getTransformers;");
					$transformers = $database->Rows();
					for ($j=1;$j<=8;$j++) {
						$device = $devices[$j-1];
						if(($_POST['Kern'.$i.$j]!="") && ($_POST['Kern'.$i.$j]==$device["Kern"])){
							$sql= 'UPDATE BAUTEIL SET BmID="'.$equipment['ID'];
							$sql.= '", BAUTEIL.Index="'.$_POST['Kern'.$i.$device["Kern"]];
							$subSql = '", BmTID="'.$_POST['ArtikelNr'.$i];
							foreach($transformers as $transformer){
								if(($transformer["ArtikelNr"]==$device["ArtikelNr"]) && ($device["BmTID"]!=$_POST['Kerndaten'.$i.$device["Kern"]])){
									$subSql = '", BmTID="'.$_POST['Kerndaten'.$i.$device["Kern"]];
								}
							}
							$sql.=$subSql;
							$sql.='" WHERE BtID="'.$device['BtID'].'";';
							$database->UpdateDb($sql);
						}elseif(($_POST['Kern'.$i.$j]!="") && ($_POST['Kern'.$i.$j]!=$device["Kern"])){
							$sql='INSERT INTO BAUTEIL VALUES (default, "'.$_POST['Kern'.$i.$j];
							$database->Query("SELECT ID FROM view_getEquipment WHERE AKS_Bezeichnung="."'".$_POST['filterID']."';");
							$sql.='", "'.$database->Rows()[0]["ID"];
							$sql.='", "'.$_POST['Funktion'];
							$sql.='", "'.$_POST['ArtikelNr'.$i].'");';
							$database->UpdateDb($sql);
						}elseif(($_POST['Kern'.$i.$j]=="") && ($_POST['Kern'.$i.$j]!=$device["Kern"])){
							$database->Query('SELECT BtID FROM view_getDevices WHERE FilterID='.$_POST['parentID'].' AND AKS_Bezeichnung='.'"'.$_POST['AKS'].'" AND Kern='.$device["Kern"].';');
							$sql="DELETE FROM BAUTEIL WHERE BtID="."'".$database->Rows()[0]["BtID"]."';";
							$database->UpdateDb($sql);
						}					
					}
					$i++;
					
				}
			
		}elseif(isset($_POST['append'])){
			for($i=1;$i<=3;$i++){
				$sql='INSERT INTO '.$_POST['tableName'].' VALUES (default, "'.$_POST['Equipment'.$i];
				$sql.='", "'.$_POST['PhaseL'.$i];
				$sql.='", "'.$_POST['parentID'];
				$sql.='", "'.$_POST['AKS'];
				$sql.='", "'.$_POST['Funktion'];
				$sql.='", "'.$_POST['SerieNr'.$i];
				$sql.='", 0';
				$sql.=', "'.Timestamp::getDateTimeLocal();
				$sql.='", "'.$_SESSION['userName'].'");';
				$database->UpdateDb($sql);
				for ($j=1;$j<=8;$j++) {
					if($_POST['Kern'.$i.$j]!=""){
						$sql='INSERT INTO BAUTEIL VALUES (default, "'.$_POST['Kern'.$i.$j];
						$sql.='", ('.'SELECT BmID FROM BETRIEBSMITTEL WHERE AKS_Bezeichnung="'.$_POST['AKS'];
						$sql.='" AND FeID="'.$_POST['parentID'];						
						$sql.='" AND Bezeichnung="'.$_POST['PhaseL'.$i];
						$sql.='"), "'.$_POST['Funktion'];
						$sql.='", "'.$_POST['ArtikelNr'.$i].'");';
						$database->UpdateDb($sql);
					}				
				}

			}
		}
		
		header("location: ../ConstrMgmt/constrMgmt.php?tableName=Betriebsmittel&filter=".$_POST['parentID']);
		break;
	}
	
};

if(isset($_POST['deleteData'])){
		$database = new Database($_SESSION['userName'],$_SESSION['password']);

		$timetag='Datum="'.Timestamp::getDateTimeLocal().'", Visum="'.$_SESSION['userName'].'"';

		if($_POST['tableName']=="Betriebsmittel"){
		$database->Query("SELECT * FROM view_getEquipment WHERE AKS_Bezeichnung="."'".$_POST['filterID']."';");
			foreach($database->Rows() AS $equipment){
				$database->UpdateDb('UPDATE BETRIEBSMITTEL SET Geloescht=1, '.$timetag.' WHERE BmID='.$equipment["ID"].';');
			}		
		}else{
			switch($_POST["tableName"]){
				case 'Mitarbeiter': $sql= 'CALL sps_deleteUser("'.$_POST["filterID"].'", "'.Timestamp::getDateTimeLocal().'", "'.$_SESSION['userName'].'");';
				break;
				case 'Anlage': $sql='UPDATE ANLAGE SET Geloescht=1, '.$timetag.' WHERE AnID='.$_POST['filterID'].';';
				break;
				case "InfObj": $sql='UPDATE INFRASTRUKTUROBJEKT SET Geloescht=1, '.$timetag.' WHERE InfObID='.$_POST['filterID'].';';
				break;
				case "Feld": $sql='UPDATE FELD SET Geloescht=1, '.$timetag.' WHERE FeID='.$_POST['filterID'].';';
				break;
			}
			$database->UpdateDb($sql);
		}
};
?>