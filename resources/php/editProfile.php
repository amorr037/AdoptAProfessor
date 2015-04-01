<?php
require_once('AuthenticationManager.php');
require_once('RequestResponse.php');
$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$firstName = $params['firstname'];
$lastName = $params['lastname'];
$email = $params['email'];
$authmanager = new AuthenticationManager();
$errMsg = $authmanager->updateUserInfo($username,$firstName,$lastName,$email);
die(json_encode (new RequestResponse($errMsg==null,$errMsg)));
/**
 * Created by PhpStorm.
 * User: cruiz
 * Date: 3/31/15
 * Time: 2:03 PM
 */