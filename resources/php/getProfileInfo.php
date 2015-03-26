<?php
 
require_once('RequestResponse.php'); 
require_once('AuthenticationManager.php');

$params = $_GET?$_GET:$_POST;
$username = $params['username'];

$am = new AuthenticationManager();
$res = $am->getProfileInfo($username);
if($res) die(json_encode (new GetProfileInfoResponse(true,$res['errMsg'],$res)));
die(json_encode (new RequestResponse(false,null)));