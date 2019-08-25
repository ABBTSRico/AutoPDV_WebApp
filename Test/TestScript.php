<?php

use PHPUnit\Framework\TestCase;

require 'SmokeTest.php';

class CalculatorTests extends TestCase
{
    private $smokeTest;
 
    protected function setUp(): void
    {
        $this->smokeTest = new SmokeTest();
    }
 
    protected function tearDown(): void
    {
        $this->smokeTest = NULL;
    }
 
    public function testAdd()
    {
        $result = $this->smokeTest->getHttpCode('http://localhost/AutoPDV/Features/index.php');
        fwrite(STDERR, "HTTP-Code: ". $result. "\n");
        $this->assertEquals(200, $result);
        //$this->assertTrue(true);
        //$this->assertTrue(false);
    }
}

