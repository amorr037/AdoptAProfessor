<?php
require_once('AuthenticationManager.php');
require_once('RequestResponse.php');
$params = $_GET?$_GET:$_POST;
$commentId = $params['commentId'];
$authmanager = new AuthenticationManager();
$errMsg = $authmanager->deleteComment($commentId);
die(json_encode (new RequestResponse($errMsg==null,$errMsg)));