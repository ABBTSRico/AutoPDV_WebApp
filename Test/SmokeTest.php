<?php

//File umbenannt

class SmokeTest {

    //Funktion um HTTP-Status Code zu prüfen
    public static function getHttpCode($url) {
        $ch = curl_init();

        //URL und Optionen festlegen
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        curl_exec($ch);
        $info = curl_getinfo($ch);
        curl_close($ch);

        return $info['http_code'];
    }
}

?>