<?php 
/**
 * 
 */
class Token extends Model {
	//public $id;
	public $id_user;
	public $tk;
	//public $date;

	
	function __construct(){
		parent::__construct();
	}

	public function getvars($clase=""){
		return parent::getvars(__CLASS__);
	}

}

 ?>