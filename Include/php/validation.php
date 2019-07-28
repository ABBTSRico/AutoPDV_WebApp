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
    

        public function checkUser($input){
            if ($this->checkAlphaOnly($input)){
                if ($this->checkLength($input,5,8)){
                    return "ok";
                }
                else{
                    return "Length";
                }
            }
            else{
                return "Alpha";
            }
        }

        public function checkPassword($input){
            if ($this->checkLength($input,6,12)){
                if ($this->checkChar($input,";")){
                    if ($this->checkChar($input," ")){
                        return "ok";
                    }
                    else{
                        return "Blanks";
                    }
                }
                else{
                    return "Semicolon";
                }
            }
            else{
                return "Lenght";
            }
        }


        //Liefert true zurück wenn nur Zeichen enthalten
        public static function checkAlphaOnly($input){
            if (ctype_alpha($input)){
                return true;
            }
            else {
                return false;
            }
        }


        //Liefert true zurück wenn Länge innerhalb des definierten Bereichs
        public static function checkLength($input,$min,$max){
            if (strlen($input) >= $min && strlen($input) <= $max){
                return true;
            }
            else{
                return false;
            }
        }

        //Liefert true zurück wenn Zeichen nicht enthalten
        public static function checkChar($input,$char){
            if (strpos($input,$char) === false){
                return true;
            }
            else{
                return false;
            } 
        }


}

?>