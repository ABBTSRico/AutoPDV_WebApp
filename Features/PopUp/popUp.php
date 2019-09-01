<?php

require_once("../../Include/php/session.php");
Session::sessionCheckGeneral();

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
        $popUp ='            
            <div id="popUp" class="modal fade"   tabindex="-1" role="dialog">            
                <div class="modal-dialog" role="document">            
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="popUpTitle">Element erfassen</h5>
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
        return $popUp;
    }
}

if(isset($_POST['getPopUpBody'])){
    if(isset($_POST['edit'])){        
        $form = new FormEdit();
        $filter=$_POST['filterID'];
        $currentTable=$_POST['tableName'];        
        
        switch($currentTable){
            case"Mitarbeiter":	
                $sql='SELECT * FROM view_getEmployee WHERE MaID="'.$filter.'"';
            break;
            case"Anlage":	
                $sql='SELECT * FROM ANLAGE JOIN ORT ON ANLAGE.OrtID=ORT.OrtID WHERE AnID="'.$filter.'"';
            break;
            case"InfObj":			
                $sql="SELECT * FROM INFRASTRUKTUROBJEKT WHERE InfObID=".$filter.";";
            break;
            case"Feld":	
                $sql="SELECT * FROM FELD WHERE FeID=".$filter.";";
            break;
            case"Betriebsmittel":	
                $sql="SELECT * FROM view_getEquipment WHERE AKS_Bezeichnung ='".$filter."';";
            break;
        }
        $form ->load($sql);
        echo $form->show();
        
    }elseif(isset($_POST['append'])){
        $form = new FormAppend();    
        echo $form->show();   
    }
    
};

?>