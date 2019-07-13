<?php            

    //************************************************************************************/
    //Variable um ohne VPN Connection zu Arbeiten
    //Anlagebewirtschafter, Administrator
    $offlineWork = false;
    //************************************************************************************/

    $userName = $_POST["benutzername"];
    $password = $_POST["password"];

    $mysqli = @new mysqli("abbtsdb",$userName,$password,"Anlagedaten");


    //************************************************************************************/
    if ($offlineWork == false){
    //************************************************************************************/


    if (empty($userName) or empty($password))
    {
        header("location: ../index.php?LoginError=miss");
    }
    else if ($mysqli->connect_error) {
        $errorNumber = $mysqli->connect_errno;
        if ($errorNumber == 2002){
            //SQL Error: 2002
            //Error with connection to MySQL database
            header("location: ../index.php?LoginError=conn");
        }
        else if ($errorNumber == 1045){
            //SQL Error: 1045
            //Error because of wrong credentials
            header("location: ../index.php?LoginError=cred");
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

        echo "<h1>Willkommen ". $row["Vorname"]. " ". $user["MaID"]. "!</h1>";


        if ($userGroup["GrID"] == 1){
            //Administrator - Benutzerverwaltung
            session_start();
            $_SESSION["userManagement"] = $user["MaID"];
            header("location: ../php/benutzerVerwaltung.php");
        }


        else if ($userGroup["GrID"] == 2){
            //Anlagebewirtschafter
            session_start();
            $_SESSION["constructionEngineer"] = $user["MaID"];
            header("location: ../php/anlageVerwaltung.php");
        }
    
    
        else if ($userGroup["GrID"] == 4){
            //Prüfer
            session_start();
            $_SESSION["tester"] = $user["MaID"];
            header("location: ../php/pruefer.php");
        }
        
        
        else {
        //Andere Rollen
        echo "andere: ". $userGroup["GrID"];
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

        //$_SESSION["userManagement"] = $userId;
        //header("location: ../php/benutzerVerwaltung.php");

        //$_SESSION["constructionEngineer"] = $userId;
        //header("location: ../php/anlageVerwaltung.php");

        $_SESSION["tester"] = $userId;
        header("location: ../php/pruefer.php");


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
