<?php 
/**
 * 
 */
class MyadManager extends AdvertisementManager {
	
	function __construct(){
		parent::__construct();
		$this->id_criteria = "id_user";
	}
	
	//OverWrite metodo para cambiar funcionalidad
	public function findById($id){
		$comilla = is_string($id) ? "'" : "";
		$query="SELECT * FROM $this->table WHERE $this->id_criteria = {$comilla}{$id}{$comilla} ORDER BY id DESC LIMIT 10";
		return $this->resultArray($this->exec($query));
	}


}

 ?>