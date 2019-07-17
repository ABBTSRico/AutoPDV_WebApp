<?php

    class validation {

        public static function checkInput($input){
        

            if ($_SERVER["REQUEST_METHOD"] == "POST"){
                //Darf für Passwort nicht verwendet werden?!
                //Für SQL Injections -> DB Queries
                $input = trim($input);
                $input = stripslashes($input);
                $input = htmlspecialchars($input);
                $input = mysqli_real_escape_string($input);
            }
            else {
                //if -> GET METHODE!
            }
        }
    
        public static function checkUser($input){
            //Check dass nur Buchstaben und maximale Länge = 10 Zeichen
        }

        public static function checkPassword($input){
            //keine Blanks, kein Strichpunkt, max. 10 Zeichen
            //algemein Problem: Nur Administrator kann Passwort setzen!!!
            //Code Injection kann so nicht mit den oben verwendeten Funktion verhindert werden
        }

}


?>