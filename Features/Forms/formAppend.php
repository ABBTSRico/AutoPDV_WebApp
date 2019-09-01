<?php

require_once("form.php");

class FormAppend extends Form{

    public function load($sql){
        $this->dbRow = $this->getElementToEdit($sql);
    }
    
    public function show(){

        switch($_POST['tableName']){
            case 'Mitarbeiter':
                $html ='
                    <input type="hidden" name="append" value=true>
                    <input type="hidden" name="tableName" value="MITARBEITER">
                    ';
            return $this->showFormHeader().$html.$this->showEmployee().'
                    </div>
                </form>';
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
                
                case 'Feld':
                    $html ='
                        <input type="hidden" name="append" value=true>
                        <input type="hidden" name="parentID" value="'.$_POST['parentID'].'">
                        <input type="hidden" name="tableName" value="FELD">
                    ';
                return $this->showFormHeader().$html.$this->showField().'
                        </div>
                    </form>';
                
                    case 'Betriebsmittel':
                        $html ='
                            <input type="hidden" name="append" value=true>
                            <input type="hidden" name="parentID" value="'.$_POST['parentID'].'">
                            <input type="hidden" name="tableName" value="BETRIEBSMITTEL">
                        ';
                    return $this->showFormHeader().$html.$this->showEquipmentAppend().'
                            </div>
                        </form>';
        }          
    }
}
?>