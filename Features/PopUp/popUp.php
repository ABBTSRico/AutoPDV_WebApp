<?php

class PopUp{

    public function getPopUp(){
        $popUpHtml = $this->getPopUpEdit();
        $popUpHtml .= $this->getPopUpAppend();
        return $popUpHtml;
    }

    private static function getPopUpEdit(){
        $popUpEditHtml ='
            
            <div id="popUpEdit" class="popUp popUp-hidden" data-active="false">            
                <div class="popUp-content">
                    <span class="popUp-close">&times;</span>
                    <p>Bearbeiten</p>
                </div>            
            </div>
        ';
        return $popUpEditHtml;
    }

    private static function getPopUpAppend(){
        $popUpEditHtml ='
            
            <div id="popUpAppend" class="popUp popUp-hidden" data-active="false">            
                <div class="popUp-content">
                    <span class="popUp-close">&times;</span>
                    <p>Hinzufügen</p>
                </div>            
            </div>
        ';
        return $popUpEditHtml;
    }
}

?>