<?php
require_once('AuthenticationManager.php');
require_once('RequestResponse.php');
$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$authmanager = new AuthenticationManager();
$errMsg = $authmanager->verifyProfessor($username);
die(json_encode (new RequestResponse($errMsg==null,$errMsg)));