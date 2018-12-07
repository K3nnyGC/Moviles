<?php 
/**
 * 
 */
class Owner extends Model {
	//public $id;
	public $dni;
	public $name;
	public $lastname;
	public $email;
	public $password;
	public $phone;

	
	function __construct(){
		parent::__construct();
	}

	public function getvars($clase=""){
		return parent::getvars(__CLASS__);
	}

}

 ?>