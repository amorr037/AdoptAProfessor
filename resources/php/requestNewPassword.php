<?php
require_once('AuthenticationManager.php');
require_once('RequestResponse.php');
$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$authmanager = new AuthenticationManager();
$userExist = $authmanager->getUserEmail($username);
if($userExist['errMsg'] != null){
    die(json_encode ($userExist['errMsg']));
}
$passwordRequest = $authmanager->forgotPasswordRequest($userExist['email']);
die(json_encode (new RequestResponse($passwordRequest==null,$passwordRequest)));
/**
 * Created by PhpStorm.
 * User: cruiz
 * Date: 3/31/15
 * Time: 5:08 PM
 */