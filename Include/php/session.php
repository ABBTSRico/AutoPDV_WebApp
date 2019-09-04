<?php

class Session {

    //Session prüfen ohne Bestimmte Rolle
    public static function sessionCheckGeneral(){
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
        if(!isset($_SESSION["constructionEngineer"]) && !isset($_SESSION["userManager"])){
            self::sessionDestroy();
        }
    }

    //Session prüfen für Anlageverwalter (ConstructionEngineer)
    public static function sessionCheckCE(){
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
        if(!isset($_SESSION["constructionEngineer"])){
            self::sessionDestroy();
        }
    }

    //Session prüfen für Benutzerverwalter (UserManager)
    public static function sessionCheckUM(){
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
        if(!isset($_SESSION["userManager"])){
            self::sessionDestroy();
        }
    }

    //Session beenden mit Meldung und Link zu Login
    public static function sessionDestroy(){
        session_destroy();
        die('
        <!DOCTYPE html>
            <html lang="en">
                <head>
                <meta charset="utf-8">
                    <title>EWZ - AutoPDV</title>
                    <link rel="stylesheet" href="../../Include/css/session.css">
                    <link rel="stylesheet" href="../../Include/bootstrap-4.3.1-dist/css/bootstrap.min.css"
                </head>
                <body>
                    <p class="SessionErrorText">Sie sind nicht korrekt angemeldet!</p>
                    <a class="SessionErrorLink" href="../index.php">->Zur Login Page</a>'
        );
    }


}

?>
