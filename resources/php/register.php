<?php
require_once('RequestResponse.php');  
require_once('AuthenticationManager.php');
$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$password = $params['password'];
$email = $params['email'];
//echo "username: $username </br> password: $password" ;
$am = new AuthenticationManager();
$res = $am->registerUser($username, $password,$email);
if($res) die(json_encode (new RequestResponse(false,$res)));
die(json_encode (new RequestResponse(true,null)));


