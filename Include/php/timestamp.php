<?php

class Timestamp {

    private static $location = 'Europe/Zurich';
    private static $formation = "Y-m-d H:i:s";

    //Kommentar
    public static function getDateTimeLocal() {
        date_default_timezone_set(Timestamp::$location);
        $timestamp = time();
        return (date(Timestamp::$formation,$timestamp));
    }

    //Kommentar
    public static function getDateTimeUTC() {
        $timestamp = time();
        return (date(Timestamp::$formation,$timestamp));
    }
}

?>