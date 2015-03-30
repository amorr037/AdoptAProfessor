<?php
require_once('AuthenticationManager.php');
require_once('RequestResponse.php');
$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$commentId = $params['commentId'];
$authmanager = new AuthenticationManager();
$errMsg = $authmanager->reportComment($username,$commentId);
die(json_encode (new RequestResponse($errMsg==null,$errMsg)));
