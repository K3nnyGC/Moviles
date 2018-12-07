<?php 

/**
 * 
 */
class Auth {
	
	function __construct(){
		parent::__construct();
	}

	public function validate(){
		if (!isset($_SESSION['token_log']) || !isset($_SESSION['user'])) {
			return false;
		} else {
			return true;
		}
	}

	public function next(){
		if (!$this->validate()) {
			exit();
		} else {
			return true;
		}
	}

	public function redir(){
		header("location: " . RAIZ);
	}

}

?>