<?php
#Todas las funciones relacionadas con las variables del sistema GET POST SESSION
class Service{

	private static $_instance;

    private function __construct(){
        $this->init();
    }

    private static function run(){
    	if (!(self::$_instance instanceof self)){
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    public static function init(){
    	session_start();
        setlocale(LC_TIME, "es_ES.utf8");
		date_default_timezone_set('America/Lima');
    }

    public static function getPostValues(){
    	if (isset($_POST)) {
    		return $_POST;
    	} else {
    		return false;
    	}

    }

    public static function getGetValues(){
    	if (isset($_GET)) {
    		return $_GET;
    	} else {
    		return false;
    	}
    }

    public static function getSessionValues(){
    	if (isset($_SESSION)) {
    		return $_SESSION;
    	} else {
    		return false;
    	}
    }


    public static function resetService(){
    	$error = isset($_SESSION['errormsg']) ? $_SESSION['errormsg'] : [];
    	unset($_SESSION);
    	unset($_POST);
    	unset($_GET);
    	session_destroy();
    	$this->init();
    	$_SESSION['errormsg'] = $error;
    }


    public static function setErrorMsg($error){
    	$_SESSION['errormsg'][] = $error; 
    }

    public static function getErrorMsg(){
        $salida = $_SESSION['errormsg'];
        $_SESSION['errormsg'] = [];
        return $salida;
    }


    public static function setVarSession($key,$value){
        $_SESSION[$key] = $value;
    }

    //Funciones especificas de un rest

    public static function parseUri(){
        $parts = explode("%40", $_SERVER['REQUEST_URI']);
        $uri = implode("@",$parts);
        return explode("/", $uri);
    }

    public static function getAction(){
        return $_SERVER['REQUEST_METHOD'];
    }

    public static function validate(){
        $vector = self::parseUri();
        return isset($vector[DEEP_ROOT+4]) ? false : true;
    }

    public static function defineVals(){
        $vector = self::parseUri();
        foreach ($vector as $key => $value) {
            if (class_exists($value)) {
                # code...
            }
        }
    }
    
    public static function getParameters(){
        return json_decode(file_get_contents('php://input'),true);
    }
    
    public static function sendPush($token){
        $firebase_token = $token->tk;
        
        $notification = array();
    	$notification['title'] = "PetLover:";
    	$notification['message'] = "Tienes un nuevo mensaje";
    	$notification['image'] = '';
    	$notification['action'] = '';
    	$notification['action_destination'] = '';
    	
    	$requestData = $notification;
    	
    	$fields = array(
    					'to' => $firebase_token,
    					'data' => $requestData,
    					);
            
            
        $url = 'https://fcm.googleapis.com/fcm/send';
        $firebase_api = "AAAAMj323F8:APA91bFT_QTxz8ktFLVsvEca_1oYl75AbWlxSCXoUBEcSz6W89zzbmlQt0gelfSfrhHU4JulCiIUh0brUmBRfOVy6Hq4S75W0mICsIsC896pawps85amyAnCRypgo_PHTQaO3PW8yfJ2";
        $headers = array(
    					'Authorization: key=' . $firebase_api,
    					'Content-Type: application/json'
    			);
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
    	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
    	
    	$result = curl_exec($ch);
    	curl_close($ch);
        
    }
}



?>