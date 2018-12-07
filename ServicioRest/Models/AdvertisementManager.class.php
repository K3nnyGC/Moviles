<?php 
/**
 * 
 */
class AdvertisementManager extends ModelManager {
	
	function __construct(){
		parent::__construct();
		$this->id = 0;
		$this->table = "advertisement";
		$this->class = "Advertisement";
		//$this->id_criteria = "email";
		//$this->vars = ["id","dni","name","lastname","email","password"];
	}


}

 ?>