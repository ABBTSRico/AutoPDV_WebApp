<?php

require_once("form.php");

class FormEdit extends Form{

    public function load($sql){
        $this->dbRow = $this->getElementToEdit($sql);
    }
    
    public function show(){
        switch($_POST['tableName']){
            case 'Mitarbeiter':
                $html ='
                    <input type="hidden" name="edit" value=true>
                    <input type="hidden" name="filterID" value="'.$this->dbRow["MaID"].'">
                    <input type="hidden" name="tableName" value="MITARBEITER">
                    ';

            return $this->showFormHeader().$html.$this->showEmployee().'
                        <button type="button" class="btn btn-primary" id="btn-del">Löschen</Button>
                    </div>
                </form>';
            case 'Anlage':
                $html ='
                    <input type="hidden" name="edit" value=true>
                    <input type="hidden" name="filterID" value="'.$this->dbRow["AnID"].'">
                    <input type="hidden" name="tableName" value="ANLAGE">
                    ';

            return $this->showFormHeader().$html.$this->showStation().'
                        <button type="button" class="btn btn-primary" id="btn-del">Löschen</Button>
                    </div>
                </form>';
            case 'InfObj':
                $html ='
                    <input type="hidden" name="edit" value=true>
                    <input type="hidden" name="parentID" value="'.$_POST['parentID'].'">
                    <input type="hidden" name="filterID" value="'.$this->dbRow["InfObID"].'">
                    <input type="hidden" name="tableName" value="INFRASTRUKTUROBJEKT">
                    ';

            return $this->showFormHeader().$html.$this->showInfOb().'
                        <button type="button" class="btn btn-primary" id="btn-del">Löschen</Button>
                    </div>
                </form>';
            case 'Feld':
            	$html ='
            		<input type="hidden" name="edit" value=true>
            		<input type="hidden" name="parentID" value="'.$_POST['parentID'].'">
            		<input type="hidden" name="filterID" value="'.$this->dbRow["FeID"].'">
            		<input type="hidden" name="tableName" value="FELD">
            	';
            	
            return $this->showFormHeader().$html.$this->showField().'
            			<button type="button" class="btn btn-primary" id="btn-del">Löschen</Button>
            		</div>
            	</form>';
            case 'Betriebsmittel':
            	$html ='
            		<input type="hidden" name="edit" value=true>
            		<input type="hidden" name="parentID" value="'.$_POST['parentID'].'">
            		<input type="hidden" name="filterID" value="'.$this->dbRow["AKS_Bezeichnung"].'">
            		<input type="hidden" name="tableName" value="BETRIEBSMITTEL">
            	';
            	
            return $this->showFormHeader().$html.$this->showEquipmentEdit().'
            			<button type="button" class="btn btn-primary" id="btn-del">Löschen</Button>
            		</div>
            	</form>';
        }
    }
}
?>