$(document).ready(function(){

    // Doppelklick auf Tabellenelement -> Öffnet nächstes Detailtabelle
    $('tr').dblclick(function() {
        filter = $(this).attr("id");
        getNextTable();
    });

    // Klick auf Tabellenelement -> Selektieren des Tabellenelements
    $('tr').click(function(){
        $('.selected').removeClass('bg-primary');
        $('.selected').removeClass('selected');
        $(this).addClass("selected");
        $(this).addClass("bg-primary");
        filter = $(this).attr("id");
    });

    // Tasteneingabe überwachen
    window.addEventListener("keydown", function (event) {
        if (event.defaultPrevented) {
          return; // Sollte nichts tun, wenn die Standardaktion abgebrochen wurde
        }
      
        var isPopUpactiv = false;

        $.each($('.popUp'),function(){
            if ($(this).css("display") == "block"){
                return isPopUpactiv = true;
            }
        });

        if (event.key == "Enter" && !isPopUpactiv) {// Betätigen der ENTER-Taste
            event.preventDefault();
            if ($('.selected').attr("id") != null){
              filter = $('.selected').attr("id");
              getNextTable();
            }else{
              alert("Es ist kein Element ausgewählt !!!");
            }
        }
    }, true);

    // Gibt die aktuell Angezeigte Tabelle aus
    function getTableName(){
        var $_GET = location.search.replace("?","").split("&").map(function(val){
            return val.split("=");
        });
        return $_GET[0][1];
    };

    // Öffnet die Detailtabelle
    function getNextTable(){        

        switch(getTableName()){
            case "Anlage":
                targetTable = "InfObj"
                break;
            case "InfObj":
                targetTable = "Feld"
                break;
            default:
                targetTable = "Leer"
        }
        window.open("constrMgmt.php?tableName="+targetTable+"&filter="+filter,"_self");
    }

    // Bearbeitungssicht anzeigen
    $('#btn-edit').click(function(){
        if ($('.selected').attr("id") != null){
            popUpID = $('#popUpEdit');
            //getPopUpBody();
            openPopUp();
        }else{
            alert("Es ist kein Element ausgewählt !!!");
        }
    });

    // Erfassungsansicht anzeigen
    $('#btn-append').click(function(){
        popUpID = $('#popUpAppend');
        $.post("../PopUp/popUp.php",{
            getPopUpBody : true,
            filterID: filter,
            tableName: getTableName()
        },function(data){
            $('.modal-body').html(data);
        })
        openPopUp();
    });

    //Ansicht öffnen generell
    function openPopUp(){
        popUpID.modal({show:true});
    };

    function closePopUp(){
        popUpID.modal('toggle');
    };

    $(document).on('click','#btn-del',function(){
        $.post("../Forms/form.php",{"deleteData":true,"tableName":getTableName(),"filterID":filter});
        closePopUp(); 
    });
    //Daten in Datenbank schreiben
    /*popUpID.on('shown.bs.modal',function(){
        
    });*/
    

    function editElement() {
        filter = $('.selected').attr("id");
        //$.post("../../Include/php/Database.php")
        //.done(function(Query))s
        openPopUpEdit();
        alert($('.selected').attr("id"));
    };
})
