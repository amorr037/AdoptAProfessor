<?php
require_once('AuthenticationManager.php');
require_once('CommentsResponse.php');
$params = $_GET?$_GET:$_POST;
$authmanager = new AuthenticationManager();
$comments = $authmanager->getReportedCommentsInfo();
die(json_encode (new CommentsResponse($comments['errMsg']==null,$comments['errMsg'],$comments['comments'])));
