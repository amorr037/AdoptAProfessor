<?php
require_once('AuthenticationManager.php');
require_once('RequestResponse.php');

var_dump($_POST);
$data = $_POST["data"];
$theData = json_decode($data);
$username = $theData->username;
$file_date= $theData->date;
$file_data = $_FILES['file'];
$file_name = $file_data['name'];
$file_size =$file_data['size'];
$file_tmp =$file_data['tmp_name'];
$file_type=$file_data['type'];

$name = $file_date._.$file_name;
move_uploaded_file($file_tmp,"../img/profile/$name");
chmod("../img/profile/$name", 0666);
$authmanager = new AuthenticationManager();
$errMsg = $authmanager->updatePrfImg($username, "resources/img/profile/$name");
echo (json_encode (new RequestResponse($errMsg==null,$errMsg)));