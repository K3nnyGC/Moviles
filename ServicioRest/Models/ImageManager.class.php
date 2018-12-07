<?php 
/**
 * 
 */
class ImageManager extends ModelManager {
	
	function __construct(){
		parent::__construct();
		$this->id = 0;
		$this->table = "image";
		$this->class = "Image";
		$this->id_criteria = "idad";
		//$this->vars = ["id","dni","name","lastname","email","password"];
	}


}

 ?>