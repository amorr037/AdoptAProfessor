<?php

require_once('AuthenticationManager.php');
require_once('RequestResponse.php');

$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$authmanager = new AuthenticationManager();
$errMsg = $authmanager->getUserEmail($username);
if($errMsg['errMsg'] != null) die(json_encode (new RequestResponse(false,$errMsg)));
//die(json_encode (new RequestResponse(true,$errMsg)));
$emailSentResponse = $authmanager->sendNewGeneratedPassword($username, $errMsg['email']);
if($emailSentResponse['errMsg'] != null)
{
//    $emailSentResponse['errMsg'] = "Unable to send email at this time!";
    die(json_encode (new RequestResponse(false,$emailSentResponse)));
}
die(json_encode (new RequestResponse(true,null)));