<?php

session_start();
require_once("../../Include/php/Database.php");

class TableLayout{

    //Tabelleninhalte ($String)
	public function getTableContent($tableName){
		$tableContent = '	
		<div class="col-md-8">
			<h2>'.$tableName.'</h2>
			<table id="table1" class="table table-condensed table-bordered table-sm">';

		switch($tableName){
			case"Anlage":
				$tableAttr = array("AKS_Bezeichnung","Anlagename","Kurzzeichen","Verteilnetz","Bezeichnung");			
				$sql="SELECT * FROM view_getStations ORDER BY AKS_Bezeichnung ASC;";
			break;
			case"InfObj":
				$tableAttr = array("AKS_Bezeichnung","InfObjBez");			
				$sql="SELECT * FROM view_getInfObj WHERE FilterID=".$_GET["filter"].";";
			break;
			case"Feld":
				$tableAttr = array("AKS_Bezeichnung","Bezeichnung");			
				$sql="SELECT * FROM view_getFields WHERE FilterID=".$_GET["filter"].";";
			break;

		}
		
		$tableContent	.= $this->getTableHeader($tableAttr)
			.$this->getTableBody($tableAttr,$sql)
			.'
				</tbody>
			</table>
		</div>
		';
        		
		
		return $tableContent;
	}

	//Kopfzeile der Tabelle ($Array[String])
	public function getTableHeader($tableAttr){

		$tableHeader = '	
			<thead>
		<tr>
		';
		
		foreach($tableAttr as $attr){
			$tableHeader .= '<th>'.$attr.'</th>';
		}

		$tableHeader .= '
			</tr>
		</thead>
		';

		return $tableHeader;
	}

	//Tabellenrumpf ($Array[String],$String)
	public function getTableBody($tableAttr,$sql){

        $dataBase = new Database($_SESSION["userName"],$_SESSION["password"]);

		$dataBase->Query($sql);
		$rows=$dataBase->Rows();

		$tableBody = '<tbody>';

		foreach($rows as $row){
			$tableBody .= '<tr id="'.$row["ID"].'">';
			foreach($tableAttr as $attr){
				$tableBody .= '<td id="'.$attr.'">'.$row[$attr].'</td>';
			}
			$tableBody .= '</tr>';
		}

		$tableBody .= '</tbody>';

		return $tableBody;
	}


}

?>