<?php
require_once('RequestResponse.php');  
require_once('AuthenticationManager.php');
require_once 'LoginResponse.php';
$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$password = $params['password'];
//echo "username: $username </br> password: $password" ;
$am = new AuthenticationManager();
$res = $am->loginUser($username, $password);// $res['key'];
if(!$res['apiKey']) die(json_encode (new LoginResponse(false,$res['errMsg'],null)));
die(json_encode (new LoginResponse(true,null,$res['apiKey'])));
