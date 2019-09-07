<?php

//File umbenannt

use PHPUnit\Framework\TestCase;

require 'smokeTest.php';
require '../Include/php/validation.php';

class AutoPDVTest extends TestCase {
  
    private $smokeTest;
    private $validation;
 
    //Testvorbereitung
    protected function setUp(): void {
        $this->smokeTest = new SmokeTest();
        $this->validation = new Validation();
    }
 
    //Testende
    protected function tearDown(): void {
        $this->smokeTest = NULL;
        $this->validation = NULL;
    }
 
    //Smoke Test ob Applikation startet 
    public function test_getHttpCode() {
        //Wenn WebApplikation gestartet werden kann wird HTTP-Code 200 zurückgegeben
        $result = $this->smokeTest->getHttpCode('http://localhost/AutoPDV/Features/index.php');
        fwrite(STDERR, "Smoke Test HTTP-Code: ". $result. "\n");
        $this->assertEquals(200, $result);
    }

    //Test validierung des Benutzernamens
    public function test_checkUser() {
        fwrite(STDERR,"\n"."Validierung checkUser"."\n");
        //Gültiger Benutzername -> ok
        $result = $this->validation->checkUser("userA");
        $this->assertEquals("ok",$result);
        //Ungültiger Benutzername -> Length
        $result = $this->validation->checkUser("user");
        $this->assertEquals("Length",$result);
        //Ungültiger Benutzername -> Alpha
        $result = $this->validation->checkUser("user2");
        $this->assertEquals("Alpha",$result);
    }

    //Test validierung des Passwortes
    public function test_checkPassword() {
        fwrite(STDERR,"\n"."Validierung checkPassword"."\n");
        //Gültiges Passwort -> ok
        $result = $this->validation->checkPassword("password");
        $this->assertEquals("ok",$result);
        //ungültiges Passwort -> Blanks
        $result = $this->validation->checkPassword("pass word");
        $this->assertEquals("Blanks",$result);
        //ungültiges Passwort -> Semicolon
        $result = $this->validation->checkPassword("password;");
        $this->assertEquals("Semicolon",$result);
        //ungültiges Passwort -> Length
        $result = $this->validation->checkPassword("passwordpassword");
        $this->assertEquals("Length",$result);
    }

    //Test validierung dass nur Buchstaben enthalten
    public function test_checkAlphaOnly() {
        fwrite(STDERR,"\n"."Validierung checkAlphaOnly"."\n");
        //Liefert true zurück wenn nur Zeichen enthalten
        $result = $this->validation->checkAlphaOnly("abcd");
        $this->assertEquals(true,$result);
        $result = $this->validation->checkAlphaOnly("ab2cd");
        $this->assertEquals(false,$result);
    }

    //Test validierung auf Länge
    public function test_checkLength() {
        fwrite(STDERR,"\n"."Validierung checkLength"."\n");
        //Anzahl Zeichen in gültigem Bereich (inkl. Grenzwert)-> True
        $result = $this->validation->checkLength("abcd",2,5);
        $this->assertEquals(true,$result);
        $result = $this->validation->checkLength("ab",2,5);
        $this->assertEquals(true,$result);
        //Anzahl Zeichen < als Gültiger Bereich -> False
        $result = $this->validation->checkLength("a",2,5);
        $this->assertEquals(false,$result);
        //Anzahl Zeichen > als gültiger Bereich -> False
        $result = $this->validation->checkLength("abcdef",2,5);
        $this->assertEquals(false,$result);
    }

    //Test validierung ob Zeichen enthalten
    public function test_checkChar() {
        fwrite(STDERR,"\n"."Validierung checkChar"."\n");
        //Zeichen enthalten - Muss False zurückgeben
        $result = $this->validation->checkChar("abc","b");
        $this->assertEquals(false,$result);
        //Zeichen nicht enthalten - Muss True zurückgeben
        $result = $this->validation->checkChar("abc","d");
        $this->assertEquals(true,$result);
    }
}

?>
