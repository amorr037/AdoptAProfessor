<?php
/**
 * Created by PhpStorm.
 * User: cruiz
 * Date: 4/14/15
 * Time: 8:46 AM
 */
require_once('RequestResponse.php');
require_once('AuthenticationManager.php');

$params = $_GET?$_GET:$_POST;
$username = $params['username'];

$am = new AuthenticationManager();
$res = $am->getProfileImg($username);
die(json_encode (new RequestResponse(false,$res['msg'])));