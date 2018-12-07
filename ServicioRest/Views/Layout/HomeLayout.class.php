<?php 

/**
 * 
 */
class HomeLayout extends Layout{
	
	function __construct(){
		parent::__construct();
		$this->title = __CLASS__;
		$this->view = new HomeView();
		$this
			->setCss(["Comun","Home","MatDes","awfo5/css/all","jqd"])
			->setJs(["Home","MatDes","jq","noti","is","jqd"])
			->setJsFooter(["HomeEnd"]);
	}



}

?>