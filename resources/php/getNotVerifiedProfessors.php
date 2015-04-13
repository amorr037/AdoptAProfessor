<?php
require_once('AuthenticationManager.php');
require_once('usersAccountsResponse.php');
$params = $_GET?$_GET:$_POST;
$authmanager = new AuthenticationManager();
$accounts = $authmanager->getNotVerifiedProfessors();
die(json_encode (new usersAccountsResponse($accounts['errMsg']==null,$accounts['errMsg'],$accounts['accounts'])));
