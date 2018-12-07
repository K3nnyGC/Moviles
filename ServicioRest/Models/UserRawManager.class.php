<?php 
/**
 * 
 */
class UserRawManager extends OwnerManager {
	
	function __construct(){
		parent::__construct();
		$this->id_criteria = "id";
	}

}

 ?>