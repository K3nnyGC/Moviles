<?php 
/**
 * 
 */
class Message extends Model {
	//public $id;
	public $iduser;
	public $iduserdest;
	public $title;
	public $msg;
	public $state;
	//public $date;

	
	function __construct(){
		parent::__construct();
	}

	public function getvars($clase=""){
		return parent::getvars(__CLASS__);
	}

}

 ?>