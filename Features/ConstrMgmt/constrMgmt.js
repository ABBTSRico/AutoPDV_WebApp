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
    });

    // Tasteneingabe überwachen
    window.addEventListener("keydown", function (event) {
        if (event.defaultPrevented) {
          return; // Sollte nichts tun, wenn die Standardaktion abgebrochen wurde
        }
      
        var isPopUpactiv = false;

        $.each($('.popUp'),function(){
            if ($(this).attr("data-active") == "true"){
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
        }else if (event.key == "Escape" && isPopUpactiv) {// Betätigen der ESC-Taste
            event.preventDefault();
            closePopUp();
        }
      }, true);
      ;

    // Öffnet die Detailtabelle
    function getNextTable(){
        var $_GET = location.search.replace("?","").split("&").map(function(val){
            return val.split("=");
        });
        currentTable = $_GET[0][1];

        switch(currentTable){
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
            openPopUp();
        }else{
            alert("Es ist kein Element ausgewählt !!!");
        }
    });

    // Erfassungsansicht anzeigen
    $('#btn-append').click(function(){
        popUpID = $('#popUpAppend');
        openPopUp();
    });

    //Ansicht öffnen generell
    function openPopUp(){
        popUpID.removeClass("popUp-hidden");
        popUpID.attr("data-active", true);
    };

    // Ansicht schliessen durch drücken X
    $('.popUp-close').click(function(){
        closePopUp();
    });

    // Ansucht schliessen durch click ausserhalb
    $('.popUp').click(function(){
        closePopUp();
    });

    //Ansucht schliessen generell
    function closePopUp(){
        $('.popUp').addClass("popUp-hidden");
        $('.popUp').attr("data-active", false);
    };

    function editElement() {
        filter = $('.selected').attr("id");
        //$.post("../../Include/php/Database.php")
        //.done(function(Query))s
        openPopUpEdit();
        alert($('.selected').attr("id"));
    };
})