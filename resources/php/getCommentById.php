<?php
require_once('AuthenticationManager.php');
require_once('CommentsResponse.php');
$params = $_GET?$_GET:$_POST;
$commentId = $params['commentId'];
$authmanager = new AuthenticationManager();
$comments = $authmanager->getComment($commentId);
die(json_encode (new CommentsResponse($comments['errMsg']==null,$comments['errMsg'],$comments['comments'])));
