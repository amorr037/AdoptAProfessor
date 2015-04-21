<?php

require_once('AuthenticationManager.php');
require_once('RequestResponse.php');

$params = $_GET?$_GET:$_POST;
$email = $params['email'];
$message = $params['message'];
$fname = $params['firstname'];
$lname = $params['lastname'];
$authmanager = new AuthenticationManager();
if($errMsg['errMsg'] != null) die(json_encode (new RequestResponse(false,$errMsg)));
//die(json_encode (new RequestResponse(true,$errMsg)));
$emailSentResponse = $authmanager->sendNewInvitation($email, $message,$fname, $lname);
if($emailSentResponse['errMsg'] != null)
{
    $emailSentResponse['errMsg'] = "Unable to send email at this time!";
    die(json_encode (new RequestResponse(false,$emailSentResponse)));
}
die(json_encode (new RequestResponse(true,null)));