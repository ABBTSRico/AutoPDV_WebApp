<?php

session_start();
require_once("../../Include/php/Database.php");

class TableLayout{

    //Tabelleninhalte ($String)
	public function getTableContent($tableName){

        $this->tableName = $tableName;

        $dataBase = new Database($_SESSION["userName"],$_SESSION["password"]);
        
        '<h1>'.$tableName.'</h1>';

		
		if ($this->tableName == "Anlage"){
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
        	$tableContent .= '<tr id="'.$row["ID"].'">';
            $tableContent .= '<td>'.$row["AKS_Bezeichnung"].'</td>';
            $tableContent .= '<td>'.$row["Anlagename"].'</td>';
            $tableContent .= '<td>'.$row["Kurzzeichen"].'</td>';
            $tableContent .= '<td>'.$row["Verteilnetz"].'</td>';
            $tableContent .= '<td>'.$row["Bezeichnung"].'</td>';
            $tableContent .= '</tr>';
		}
						
		$tableContent .= '
				</body>
			</table>
		';    
        }else if($this->tableName == "InfObj"){
            $tableContent= '
			<table id="table1" class="table col-md-8 table-condensed table-bordered table-sm">
				<thead>
					<tr>
						<th>AKS_Bezeichnung</th><th>Bezeichnung</th>
					<tr>
				</thead>
				<body>
		';
        $sql="SELECT * FROM Anlagedaten.INFRASTRUKTUROBJEKT ORDER BY AKS_Bezeichnung ASC;";
		$dataBase->Query($sql);
        $rows=$dataBase->Rows();                  

        foreach($rows as $row){
        	$tableContent .= '<tr id="'.$row["InfObID"].'">';
            $tableContent .= '<td>'.$row["AKS_Bezeichnung"].'</td>';
            $tableContent .= '<td>'.$row["Infrastrukturobjektbezeichnung"].'</td>';
            $tableContent .= '</tr>';
		}
						
		$tableContent .= '
				</body>
			</table>
		';
        }		
		
		return $tableContent;
	}
}

?>