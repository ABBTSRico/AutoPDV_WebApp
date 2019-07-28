<?php            

    require_once("validation.php");

    //************************************************************************************/
    //Variable um ohne VPN Connection zu Arbeiten
    //Anlagebewirtschafter, Administrator
    $offlineWork = false;
    //************************************************************************************/

    $validation = new Validation();

    $userName = $_POST["benutzername"];
    $password = $_POST["password"];

    //$check = $validation->checkInput("$userName");
    //$check = $validation->checkInput("$password");
    $checkUser = $validation->checkUser("$userName");
    $checkPassword = $validation->checkPassword("$password");
    
    $mysqli = @new mysqli("abbtsdb",$userName,$password,"Anlagedaten");


    //************************************************************************************/
    if ($offlineWork == false){
    //************************************************************************************/


    if (empty($userName) or empty($password))
    {
        header("location: ../../Features/index.php?LoginError=miss");
    }
    else if ($checkUser != "ok" or $checkPassword != "ok"){
        header("location: ../../Features/index.php?LoginError=val");
    }
    else if ($mysqli->connect_error) {
        $errorNumber = $mysqli->connect_errno;
        if ($errorNumber == 2002){
            //SQL Error: 2002
            //Error with connection to MySQL database
            header("location: ../../Features/index.php?LoginError=conn");
        }
        else if ($errorNumber == 1045){
            //SQL Error: 1045
            //Error because of wrong credentials
            header("location: ../../Features/index.php?LoginError=cred");
        }
    }
    else
    {
        //Korrekter Login
        $con = mysqli_connect("abbtsdb",$userName,$password,"Anlagedaten");
        
        $query="SELECT Vorname FROM MITARBEITER WHERE Kurzzeichen=\"". $userName."\";";
        $row=mysqli_fetch_assoc(mysqli_query($con,$query));
    
        $query="SELECT MaID FROM MITARBEITER WHERE Kurzzeichen=\"". $userName."\";";
        $user=mysqli_fetch_assoc(mysqli_query($con,$query));

        $query="SELECT GrID FROM MITARBEITER WHERE Kurzzeichen=\"". $userName."\";";
        $userGroup=mysqli_fetch_assoc(mysqli_query($con,$query));

        //echo "<h1>Willkommen ". $row["Vorname"]. " ". $user["MaID"]. "!</h1>";


        if ($userGroup["GrID"] == 2){
            //Anlagebewirtschafter
            session_start();
            $_SESSION["constructionEngineer"] = $user["MaID"];
            header("location: ../../Features/ConstrMgmt/constrMgmt.php");
        }
    
    
        else if ($userGroup["GrID"] == 6){
            //Benutzerverwalter
            session_start();
            $_SESSION["userManager"] = $user["MaID"];
            header("location: ../../Features/UserMgmt/userMgmt.php");
        }
        
        
        else {
            //Error because of wrong role
            header("location: ../../Features/index.php?LoginError=role");
        }

    }
        
    }   //Klammer Für offline Work ohne VPN


    //************************************************************************************/
    //Test Login ohne VPN Connection mit Zufallsvariable als Wert in Session ID!
    //************************************************************************************/
    //userManagement / constructionEngineer / tester

    else {
        session_start();
        $userId = 14;

        $_SESSION["userManagement"] = $userId;
        header("location: ../../Features/UserMgmt/userMgmt.php");

        //$_SESSION["constructionEngineer"] = $userId;
        //header("location: ../../Features/ConstrMgmt/constrMgmt.php");


        //https://www.php.net/manual/de/function.session-create-id.php
        //$userId = 14;
        //$ranomSessionId = session_create_id($userId. "S");
        //$_SESSION["userid"] = $ranomSessionId;

    }
    //************************************************************************************/


        //Entsprechende (geschützte) Seite öffnen
        
        //Geschützter Bereich:
        /*
        <?php
        session_start();
        if(!isset($_SESSION["userid"])) {
            die('Bitte zuerst <a href="login.php">einloggen</a>');
        }
        //Abfrage der Nutzer ID vom Login
        $userid = $_SESSION["userid"];
        echo "Hallo User: ".$userid;
        ?>
        */


        //Logout
        /*      
        <?php
        session_start();
        session_destroy();
         
        echo "Logout erfolgreich";
        ?>
        */
    

?>
