<?php 
session_start();
define ('DS', DIRECTORY_SEPARATOR); 
define ('HOME', dirname(__FILE__)); 
$guest  = array("user/login","user/check","user/logout",
			    "book/pindex","book/detail",
				);

$user   = array("user/home","book/index",
				"book/add","book/store");


$controller = "book"; 
$action = "pindex"; 
$query = null; 

if (isset($_GET['id'])) 
{ 
   	$params = array(); 
	$params = explode("/", $_GET['id']); 
	$controller = ucwords($params[0]); 
	if (isset($params[1]) && !empty($params[1])) 
	{ 
		$action = $params[1]; 
	} 
	if (isset($params[2]) && !empty($params[2])) 
	{ 
		$query = $params[2]; 
	} 
}

require_once("models/model.php");
require_once("models/".$controller."_model.php");
require_once("utilities/view.php");
require_once("controllers/controller.php");
require_once("controllers/".$controller."_controller.php");

$valid=false;
$req=strtolower("$controller/$action");
if (in_array($req , $guest)) $valid=true;
else{
  if ( isset($_SESSION['user']) )	
  {
	 $role =$_SESSION['user']['Role'];
	 if($role=="Admin") 
		  $valid=true; 
	 else if (in_array($req , $user)) 
		   $valid=true;
  }
}	
if($valid) {
    $modelName = $controller; 
    $controller .= '_controller'; 
    $load = new $controller($modelName, $action); 
   if (method_exists($load, $action)  ) 
	  $load->$action($query); 
   else  echo "request invalid";
}else {
	header("location:index.php?id=user/login");
}



?>