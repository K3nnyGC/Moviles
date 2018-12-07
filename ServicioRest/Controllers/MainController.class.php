<?php 


/**
 * 
 */
class MainController extends Controller{
	
	function __construct(){
		$this->action = $_SERVER['REQUEST_METHOD'];
		$this->words = $this->parseUrl();
		$this->modelId = false;
		
	}


	public function startService(){
		$clase = array_keys($this->words)[0];
		$this->modelId = $this->words[$clase];
		if (class_exists($clase)) {
			$this->defineMethods($clase ."Manager");
		} else {
			$rest = new Rest();
			$rest->response();
		}
		

	}

	private function parseUrl(){
		$values = Service::parseUri();
		$output = [];
		for ($i=DEEP_ROOT; $i < count($values) ; $i++) { 
			$key = $values[$i];
			$value = isset($values[$i+1]) ? $values[$i+1] : false;
			$i+=1;
			$output[$key] = $value; 
		}
		return $output;
	}

	private function defineMethods($model){

		$rest = new Rest();
		$rest
			->setClass($model)
			->setModelId($this->modelId)
			->setParameters(Service::getParameters());

      	switch ($this->action) {
         case "GET":
            $rest->getMethod();
            break;
         case "POST":
            $rest->postMethod();
            break;
         case "DELETE":
            $rest->deleteMethod();
            break;
         case "PUT":
            $rest->putMethod();
            break;
         default:
            break;
      	}

      	$rest->response();
	}

}



 ?>