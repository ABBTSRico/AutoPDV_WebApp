<?php

session_start();
require_once("../../Include/php/Database.php");
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

	protected function getElementToEdit($sql){
		$this->database->Query($sql);
		return $this->database->Rows()[0];
	}
}

if(isset($_POST['saveData'])){
	$database = new Database($_SESSION['userName'],$_SESSION['password']);
	switch($_POST['tableName']){
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
			$sql.=', 0);';
			$database->UpdateDb($sql);
		}
		header("location: ../ConstrMgmt/constrMgmt.php?tableName=Anlage");
		break;
		case "INFRASTRUKTUROBJEKT":
		if(isset($_POST['edit'])){
			$sql='UPDATE '.$_POST['tableName'].' SET AKS_Bezeichnung="'.$_POST['AKS'];
			$sql.= '", Infrastrukturobjektbezeichnung="'.$_POST['InfObj'];
			$sql.='" WHERE InfObID="'.$_POST['filterID'].'";';
			$database->UpdateDb($sql);
			
		}elseif(isset($_POST['append'])){
			$sql='INSERT INTO '.$_POST['tableName'].' VALUES (default, "'.$_POST['parentID'];
			$sql.='", "'.$_POST['AKS'];
			$sql.='", "'.$_POST['InfObj'];
			$sql.='", 0);';
			$database->UpdateDb($sql);
		}
		
		header("location: ../ConstrMgmt/constrMgmt.php?tableName=InfObj&filter=".$_POST['parentID']);
		break;
	}
	
};

if(isset($_POST['deleteData'])){
		$database = new Database($_SESSION['userName'],$_SESSION['password']);
			printf($sql);

		switch($_POST["tableName"]){
			case 'Anlage': $sql='UPDATE ANLAGE SET Geloescht=1 WHERE AnID=';
			break;
			case "InfObj": $sql='UPDATE INFRASTRUKTUROBJEKT SET Geloescht=1 WHERE InfObID=';
			break;
		}
		$sql .=	$_POST['filterID'].';';

		$database->UpdateDb($sql);
};
?>