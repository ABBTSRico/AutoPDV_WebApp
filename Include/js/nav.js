$(document).ready(function(){

    //Zurückknopf ausblenden
    if(getTableName() =="Anlage" || getTableName() == "Mitarbeiter"){
        $("#btn-back").hide();
    }

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

        $.each($('#popUp'),function(){
            if ($(this).css("display") == "block"){
                return isPopUpactiv = true;
            }
        });

        if (event.key == "Enter" && !(isPopUpactiv || window.location.pathname==="/autopdv/features/index.php")) {// Betätigen der ENTER-Taste
            event.preventDefault();
            if ($('.selected').attr("id") != null){
              filter = $('.selected').attr("id");
              getNextTable();
            }else{
              alert("Es ist kein Element ausgewählt !!!");
            }
        }else if(event.key == "Enter" && isPopUpactiv){
            $('#form').submit();
        }else if(event.key == "Enter" && window.location.pathname==="/autopdv/features/index.php"){
            $('#loginForm').submit();
        }
    }, true);

    // Gibt die aktuell angezeigte Tabelle aus
    function getTableName(){
        var $_GET = location.search.replace("?","").split("&").map(function(val){
            return val.split("=");
        });
        return $_GET[0][1];

    };    // Gibt die aktuell angezeigte *ID aus
    function getID(){
        var $_GET = location.search.replace("?","").split("&").map(function(val){
            return val.split("=");
        });
        if($_GET.length > 1){
            return $_GET[1][1];
        }
    };

    // Öffnet die Detailtabelle
    function getNextTable(){        

        if(getTableName() != "BETRIEBSMITTEL" || getTableName() != "MITARBEITER"){
            switch(getTableName()){
                case "Anlage":
                    targetTable = "InfObj"
                    break;
                case "InfObj":
                    targetTable = "Feld"
                    break;
                case "Feld":
                    targetTable = "Betriebsmittel"
                    break;
            }
            window.open("constrMgmt.php?tableName="+targetTable+"&filter="+filter,"_self");            
        }
    }

    // Bearbeitungssicht anzeigen
    $('#btn-edit').click(function(){
        $('#popUpTitle').html("Element bearbeiten");
        if ($('.selected').attr("id") != null){
            $.post("../PopUp/popUp.php",{
                getPopUpBody : true,
                edit: true,
                filterID: filter,
                tableName: getTableName(),
                parentID: getID()
            },function(data){
                $('.modal-body').html(data);
            })
            openPopUp();

        }else{
            alert("Es ist kein Element ausgewählt !!!");
        }
    });

    // Erfassungsansicht anzeigen
    $('#btn-append').click(function(){
        $('#popUpTitle').html("Element erfassen");
        $.post("../PopUp/popUp.php",{
            getPopUpBody : true,
            append : true,
            tableName: getTableName(),
            parentID: getID()
        },function(data){
            $('.modal-body').html(data);
        })
        openPopUp();
    });

    //Ansicht öffnen generell
    function openPopUp(){
        $('#popUp').modal({show:true});
    };

    //Ansicht schliessen generell
    function closePopUp(){
        $('#popUp').modal('toggle');
        location.reload();
    };

    //Daten in Datenbank schreiben
    $(document).on('click','#btn-del',function(){
        var r = confirm("Wollen Sie das ausgewählte Element wirklich löschen?")
        if(r==true){
            $.post("../Forms/form.php",{"deleteData":true,"tableName":getTableName(),"filterID":filter});
            closePopUp(); 
        }
    });
})
