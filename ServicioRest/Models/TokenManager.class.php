<?php 
/**
 * 
 */
class TokenManager extends ModelManager {
	
	function __construct(){
		parent::__construct();
		$this->id = 0;
		$this->table = "token";
		$this->class = "Token";
		//$this->id_criteria = "email";
		//$this->vars = ["id","dni","name","lastname","email","password"];
	}


}

 ?>