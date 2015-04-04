<?php

require_once('AuthenticationManager.php');
require_once('RequestResponse.php');

$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$authmanager = new AuthenticationManager();
$errMsg = $authmanager->getUserEmail($username);
if($errMsg['errMsg'] != null) die(json_encode (new RequestResponse(false,$errMsg)));
//die(json_encode (new RequestResponse(true,$errMsg)));
$emailSentResponse = $authmanager->sendNewGeneratedPassword($userExist['email']);
die(json_encode (new RequestResponse($passwordRequest==null,$emailSentResponse)));
/**
 * Created by PhpStorm.
 * User: cruiz
 * Date: 3/31/15
 * Time: 5:08 PM
 */