<?php 
/**
 * 
 */
class OwnerManager extends ModelManager {
	
	function __construct(){
		parent::__construct();
		$this->id = 0;
		$this->table = "owner";
		$this->class = "Owner";
		$this->id_criteria = "email";
		//$this->vars = ["id","dni","name","lastname","email","password"];
	}


}

 ?>