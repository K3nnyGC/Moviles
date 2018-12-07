<?php 

/**
 * 
 */
class Controller {
	
	function __construct(){
		$this->layout = new Layout();		
	}

	function deployLayout(){
		$this->layout->deploy();
	}

	function addError($arrayerror){
		foreach ($arrayerror as $key => $value) {
			$this->layout->addError($value);
		}
		
	}

}

?>