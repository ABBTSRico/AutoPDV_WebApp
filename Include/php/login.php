<?php            

session_start();
require_once("validation.php");
require_once("database.php");

//Variable um ohne VPN Connection zu Arbeiten -> Zu löschen
$offlineWork = false;

$validation = new Validation();

$userName = $_POST["benutzername"];
$password = $_POST["password"];

$_SESSION["userName"] = $userName;
$_SESSION["password"] = $password;

$checkUser = $validation->checkUser("$userName");
$checkPassword = $validation->checkPassword("$password");
    
$mysqli = @new mysqli("abbtsdb",$userName,$password,"Anlagedaten");

if (empty($userName) or empty($password)){
    header("location: ../../Features/index.php?LoginError=miss");
}
else if ($checkUser != "ok" or $checkPassword != "ok"){
    header("location: ../../Features/index.php?LoginError=val");
}
else if ($mysqli->connect_error){
    $errorNumber = $mysqli->connect_errno;
    if ($errorNumber == 2002){
        //SQL Error: 2002 - Fehler bei Verbindung mit MySQL Datenbank
        header("location: ../../Features/index.php?LoginError=conn");
    }
    else if ($errorNumber == 1045){
        //SQL Error: 1045 - Ungültige Anmeldung (Benutzername / Passwort)
        header("location: ../../Features/index.php?LoginError=cred");
    }
    else if ($errorNumber == 1049){
        //SQL Error: 1049 - Unbekannte Datenbank)
        header("location: ../../Features/index.php?LoginError=unkn");
    }
}
else{
    //Korrekter Login
    $con = mysqli_connect("abbtsdb",$userName,$password,"Anlagedaten");
    
    $query="SELECT Vorname FROM MITARBEITER WHERE Kurzzeichen=\"". $userName."\";";
    $row=mysqli_fetch_assoc(mysqli_query($con,$query));
    
    $query="SELECT MaID FROM MITARBEITER WHERE Kurzzeichen=\"". $userName."\";";
    $user=mysqli_fetch_assoc(mysqli_query($con,$query));

    $query="SELECT GrID FROM MITARBEITER WHERE Kurzzeichen=\"". $userName."\";";
    $userGroup=mysqli_fetch_assoc(mysqli_query($con,$query));

    if ($userGroup["GrID"] == 1){
        //Anlagebewirtschafter
        $_SESSION["administrator"] = $user["MaID"];
        $_SESSION["constructionEngineer"] = $user["MaID"];
        $_SESSION["userManager"] = $user["MaID"];
        header("location: ../../Features/Admin/admin.php");
    }
    
    elseif ($userGroup["GrID"] == 2){
        //Anlagebewirtschafter
        $_SESSION["constructionEngineer"] = $user["MaID"];
        header("location: ../../Features/ConstrMgmt/constrMgmt.php?tableName=Anlage");
    }
    
    else if ($userGroup["GrID"] == 6){
        //Benutzerverwalter
        $_SESSION["userManager"] = $user["MaID"];
        header("location: ../../Features/UserMgmt/userMgmt.php?tableName=Mitarbeiter");
    }
        
    else{
        //Rolle des Benutzers hat keine Berechtigung für Web Applikation
        header("location: ../../Features/index.php?LoginError=role");
    }
}

?>