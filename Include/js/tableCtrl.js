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
          return; // Should do nothing if the default action has been cancelled
        }
      
        var handled = false;
        if (event.key == 13) {// Betätigen der Entertaste
            handled = true;
        } else if (event.keyCode == 13) {// Betätigen der Entertaste
            handled = true;
        }
      
        if (handled) {
          event.preventDefault();
          if ($('.selected').attr("id") == null){
            alert("Es ist kein Element ausgewählt !!!");
          }else{
            filter = $('.selected').attr("id");
            getNextTable();
          }
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
    document.getElementById("btn-edit").addEventListener("click", editElement);

    function editElement() {
        alert($(".selected").text());
    };
})