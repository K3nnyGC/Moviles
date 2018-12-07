<?php 
/**
 * 
 */
class Advertisement extends Model {
	//public $id;
	public $title;
	public $status;
	public $description;
	public $image;
	public $latitude;
	public $longitude;
	public $address;
	//public $date;
	public $flag;
	public $id_user;

	
	function __construct(){
		parent::__construct();
	}

	public function getvars($clase=""){
		return parent::getvars(__CLASS__);
	}

}

 ?>