<?php

require_once("form.php");

class FormAppend extends Form{

    public function load($sql){
        $this->dbRow = $this->getElementToEdit($sql);
    }
    
    public function show(){

        switch($_POST['tableName']){
            case 'Anlage':
                $html ='
                    <input type="hidden" name="append" value=true>
                    <input type="hidden" name="tableName" value="ANLAGE">
                    ';
            return $this->showFormHeader().$html.$this->showStation().'
                    </div>
                </form>';

            case 'InfObj':
                $html ='
                    <input type="hidden" name="append" value=true>
                    <input type="hidden" name="parentID" value="'.$_POST['parentID'].'">
                    <input type="hidden" name="tableName" value="INFRASTRUKTUROBJEKT">
                    ';
            return $this->showFormHeader().$html.$this->showInfOb().'
                    </div>
                </form>';
        }          
    }
}
?>