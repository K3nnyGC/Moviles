<?php 
/**
 * 
 */
class MessageManager extends ModelManager {
	
	function __construct(){
		parent::__construct();
		$this->id = 0;
		$this->table = "message";
		$this->class = "Message";
		//$this->id_criteria = "email";
		//$this->vars = ["id","dni","name","lastname","email","password"];
	}
	
	//INSERT extendido para enviar notificacion al destinatario

	public function create($modelo){
		$result = parent::create($modelo);
		$created = $result ? $this->findLast() : NULL;
		if ($created!==NULL) {
			$tm = new TokenManager();
			//$token = $tm->findById($created->iduserdest);
			$tokenRaw = $tm->exec("SELECT * FROM {$tm->table} WHERE id_user = {$created->iduserdest}  ORDER BY id DESC LIMIT 1");
			$token = $tm->resultObject($tokenRaw);
			Service::sendPush($token);
		}
		return $result;
		
	}


}

 ?>