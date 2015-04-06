<?php

require_once('AuthenticationManager.php');
require_once('RequestResponse.php');

$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$authmanager = new AuthenticationManager();
$errMsg = $authmanager->getUserEmail($username);
if($errMsg['errMsg'] != null) die(json_encode (new RequestResponse(false,$errMsg)));
//die(json_encode (new RequestResponse(true,$errMsg)));
$emailSentResponse = $authmanager->sendNewGeneratedPassword($username, $userExist['email']);
if($emailSentResponse['errMsg'] != null)
{
//    $emailSentResponse['errMsg'] = "Unable to send email at this time!";
    die(json_encode (new RequestResponse(false,$emailSentResponse)));
}
die(json_encode (new RequestResponse(true,null)));
/**
 * Created by PhpStorm.
 * User: cruiz
 * Date: 3/31/15
 * Time: 5:08 PM
 */