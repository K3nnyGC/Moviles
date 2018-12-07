<?php 
/**
 * 
 */
class Image extends Model {
	//public $id;
	public $img;
	public $idad;
	//public $date;

	
	function __construct(){
		parent::__construct();
	}

	public function getvars($clase=""){
		return parent::getvars(__CLASS__);
	}

}

 ?>