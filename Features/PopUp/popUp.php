<?php

session_start();
require_once("../../Include/php/Database.php");
require_once("../Forms/form.php");
require_once("../Forms/formEdit.php");

class PopUp{

	private $tableName = "";

	function __construct(){
		$this->tableName = "Anlage";
	}

	function __construct1($tableName){
		$this->tableName = $tableName;
	}

    public function getPopUp(){
        $popUpHtml = $this->getPopUpEdit();
        $popUpHtml .= $this->getPopUpAppend();
        return $popUpHtml;
    }

    private static function getPopUpEdit(){
        $popUpEditHtml ='
            
            <div id="popUpEdit" class="modal fade"   tabindex="-1" role="dialog">            
                <div class="modal-dialog" role="document">            
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Element erfassen</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h1>TEST</h1>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btn-back" data-dismiss="modal">Abbrechen</Button>
                        <button type="button" class="btn btn-primary" id="btn-save">Speichern</Button>
                        </div>
                    </div>
                </div>           
            </div>
        ';
        return $popUpEditHtml;
    }

    private function getPopUpAppend(){
        $popUpEditHtml ='            
            <div id="popUpAppend" class="modal fade"   tabindex="-1" role="dialog">            
                <div class="modal-dialog" role="document">            
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Element erfassen</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                        </div>
                    </div>
                </div>            
            </div>
        ';
        return $popUpEditHtml;
    }

    public static function getPopUpBody($filter,$currentTable){ 

        switch($currentTable){
			case"Anlage":
				//$tableAttr = array("AKS_Bezeichnung","Anlagename","Kurzzeichen","Verteilnetz","Bezeichnung");			
				$sql='SELECT * FROM ANLAGE JOIN ORT ON ANLAGE.OrtID=ORT.OrtID WHERE AnID="'.$filter.'"';//".$_GET["filter"];
			break;
			case"InfObj":
				//$tableAttr = array("AKS_Bezeichnung","InfObjBez");			
				$sql="SELECT * FROM INFRASTRUKTUROBJEKT WHERE InfObID=".$_GET["filter"].";";
			break;
			case"Feld":
				//$tableAttr = array("AKS_Bezeichnung","Bezeichnung");			
				$sql="SELECT * FROM FELD WHERE FeID=".$_GET["filter"].";";
            break;
        }
        
	    $form = new FormEdit();
        $form ->load($sql);
        return $form->show();
        //$form = new Form(); 
        $dataBase = new Database($_SESSION["userName"],$_SESSION["password"]);

        $dataBase->Query($sql);    
        $rows=$dataBase->Rows();

        $popUpBodyHtml  ='
        <form>
            <div>
        ';
        foreach($rows as $row){
            $attrName = $row["Field"];
            $popUpBodyHtml  .= '
            <div class="form-group">
                <label for="'.$attrName.'">'.$attrName.'</label>
                <input type="text" class="form-control" id="'.$attrName.'" name="'.$attrName.'">
            </div>';
        }
        return $popUpBodyHtml .='
            </div>
        </form>'.file_get_contents("../Forms/formEditStation.html");


         return $popUpBodyHtml;
    }
}

if(isset($_POST['getPopUpBody'])){
    echo PopUp::getPopUpBody($_POST['filterID'],$_POST['tableName']);
};

?>