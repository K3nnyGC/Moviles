<?php 
/**
 * 
 */
class MyMsgManager extends MessageManager {
	
	function __construct(){
		parent::__construct();
		$this->id_criteria = "iduserdest";
	}
	
	//OverWrite metodo para cambiar funcionalidad
	public function findById($id){
		$comilla = is_string($id) ? "'" : "";
		$query="SELECT * FROM $this->table WHERE $this->id_criteria = {$comilla}{$id}{$comilla} AND state = 1 ORDER BY id DESC LIMIT 10";
		return $this->resultArray($this->exec($query));
	}


}

 ?>