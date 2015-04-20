<?php

require_once('RequestResponse.php');
require_once('AuthenticationManager.php');

$am = new AuthenticationManager();
$res = $am->getProfessors();
if($res) die(json_encode($res));
die(json_encode (new RequestResponse(false,null)));