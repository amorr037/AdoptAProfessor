<?php
require_once('AuthenticationManager.php');
require_once('CommentsResponse.php');
$params = $_GET?$_GET:$_POST;
$username = $params['username'];
$authmanager = new AuthenticationManager();
$comments = $authmanager->getStudentComments($username);
die(json_encode (new CommentsResponse($comments['errMsg']==null,$comments['errMsg'],$comments['comments'])));
