<?php

require_once("form.php");

class FormEdit extends Form{

    public function load($sql){
        $this->dbRow = $this->getElementToEdit($sql);
    }
    
    public function show(){
        $this->database->Query("SELECT VnID AS ID, AKS_Bezeichnung, Verteilnetzname AS NET FROM VERTEILNETZ");
        $distNets = $this->database->Rows();
        $this->database->Query("SELECT NeID AS ID, AKS_Bezeichnung, Bezeichnung AS NET FROM NETZEBENE");
        $netLvls = $this->database->Rows();
        
        $html='
        <form id="editForm" method="POST" action="../Forms/form.php">
        <input type="hidden" name="saveData" value=true>
        <input type="hidden" name="filterID" value="'.$this->dbRow["AnID"].'">
        <input type="hidden" name="tableName" value="ANLAGE">
            <div class="row">
                <div class="form-group col-md-4">
                    <label for="Verteilnetz:">Verteilnetz:</label><br/>
                    <select id="distNetwotk" name="Verteilnetz class="form-control">
        ';
                        foreach($distNets as $distNet){
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
                <div class="form-group col-md-4">
                    <label for="Netzebene:">Netzebene:</label><br/>
                    <select id="netLvl" name="Netzebene class="form-control">
        ';
                        foreach($netLvls as $netLvl){
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
            <button type="button" class="btn btn-primary" id="btn-del">Löschen</Button>
            </div>
            <!--<input class="btn btn-primary" type="submit">-->
        </form>
        ';
        return $html;

    }

    public function saveData($filter,$tableName){
        return "Speichern";
       // $sql = 'UPDATE ANLAGE SET Adresse="'.$tableName.'" WHERE AnID="'.$filter.'";';
       // echo "<h1>".$this->database->UpdateDb($sql)."</h1>";
    }
}
?>