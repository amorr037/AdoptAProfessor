<?php

require_once('AuthenticationManager.php');
require_once('RequestResponse.php');

$params = $_GET?$_GET:$_POST;
$email = $params['email'];
$name = $params['name'];
$comment = $params['comment'];
$authmanager = new AuthenticationManager();
$emailSentResponse = $authmanager->sendContactUsEmail($email, $name, $comment);
if($emailSentResponse['errMsg'] != null) {
    die(json_encode (new RequestResponse(false,$emailSentResponse)));
}
die(json_encode (new RequestResponse(true,null)));