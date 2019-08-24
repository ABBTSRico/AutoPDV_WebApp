<?php

session_start();
require_once("../../Include/php/Database.php");
require_once("formEdit.php");

abstract class Form{
protected $database;
protected $sql;
protected $dbRow;

	function __construct(){
		$this->database = new Database($_SESSION["userName"],$_SESSION["password"]);
	}

	public abstract function load(string $sql);

	public abstract function show();

	protected function getElementToEdit($sql){
		$this->database->Query($sql);
		return $this->database->Rows()[0];
	}
}

if(isset($_POST['saveData'])){
		$database = new Database($_SESSION['userName'],$_SESSION['password']);
		$database->UpdateDb('UPDATE '.$_POST['tableName'].' SET Adresse="'.$_POST['Adresse'].'" WHERE AnID="'.$_POST['filterID'].'";');
};

if(isset($_POST['deleteData'])){
		$database = new Database($_SESSION['userName'],$_SESSION['password']);

		switch($_POST["tableName"]){
			case 'Anlage': $sql='UPDATE ANLAGE SET Geloescht=1 WHERE AnID=';
				break;
		}
		$sql .=	$_POST['filterID'].';';

		$database->UpdateDb($sql);
		echo json_encode($_POST);
};
?>