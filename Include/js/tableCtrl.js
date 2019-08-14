$(document).ready(function(){
    $('tr').dblclick(function() {
        window.open("constrMgmt.php?tableName=InfObj","_self");
    });
    $('tr').click(function(){
        $('.selected').removeClass('bg-primary');
        $('.selected').removeClass('selected');
        $(this).addClass("selected");
        $(this).addClass("bg-primary");
    })
})