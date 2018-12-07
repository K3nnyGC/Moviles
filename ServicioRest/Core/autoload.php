<?php
include_once("env.php");
spl_autoload_register(function ($nombre_clase) {
	$archivo = "../Core/".$nombre_clase . ".class.php";
	if (file_exists($archivo)) {
		include $archivo;
	} else {
		return false;
	}

    
});


spl_autoload_register(function ($nombre_clase) {
    $archivo = "../Models/".$nombre_clase . ".class.php";
	if (file_exists($archivo)) {
		include $archivo;
	} else {
		return false;
	}
});


spl_autoload_register(function ($nombre_clase) {
	$archivo = "../Controllers/".$nombre_clase . ".class.php";
	if (file_exists($archivo)) {
		include $archivo;
	} else {
		return false;
	}

    
});



spl_autoload_register(function ($nombre_clase) {
	$archivo = "../Views/Layout/".$nombre_clase . ".class.php";
	if (file_exists($archivo)) {
		include $archivo;
	} else {
		return false;
	}

    
});

spl_autoload_register(function ($nombre_clase) {
	$archivo = "../Views/Pages/".$nombre_clase . ".class.php";
	if (file_exists($archivo)) {
		include $archivo;
	} else {
		return false;
	}

    
});

spl_autoload_register(function ($nombre_clase) {
	$archivo = "../Views/Pages/Parts/".$nombre_clase . ".class.php";
	if (file_exists($archivo)) {
		include $archivo;
	} else {
		return false;
	}

    
});




 ?>