<?php


require_once('RequestResponse.php');
require_once('AuthenticationManager.php');

$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$oldpassword = $params['oldpassword'];
$newpasswrod = $params['newpasswrod'];

$am = new AuthenticationManager();
$res = $am->changePsswRequest($username,$oldpassword,$newpasswrod);
if($res['errMsg'] != null) die(json_encode (new RequestResponse(false,$res)));
$res['msg'] = "Password Successfully changed!";
die(json_encode (new RequestResponse(true,$res)));
/**
 * Created by PhpStorm.
 * User: cruiz
 * Date: 4/4/15
 * Time: 12:52 PM
 */