<?php
require_once('AuthenticationManager.php');
require_once('RequestResponse.php');
var_dump($_POST);
$data = $_POST["data"];
$theData = json_decode($data);
$text = $theData->text;
$from = $theData->from;
$to = $theData->to;
if(isset($_FILES['file'])){
    //The error validation could be done on the javascript client side.
    $file_data = $_FILES['file'];
    $file_name = $file_data['name'];
    $file_size =$file_data['size'];
    $file_tmp =$file_data['tmp_name'];
    $file_type=$file_data['type'];
    $file_name = time().$file_name;
    move_uploaded_file($file_tmp,"../img/uploaded/$file_name");
    $authmanager = new AuthenticationManager();
    $errMsg = $authmanager->insertComment($from, $to, $text, "resources/img/uploaded/$file_name");
    echo (json_encode (new RequestResponse($errMsg==null,$errMsg)));
//    echo json_encode(array("success" => true, "path" => "resources/img/uploaded/$file_name"));
}
else{
    $authmanager = new AuthenticationManager();
    $errMsg = $authmanager->insertComment($from, $to, $text, null);
    echo (json_encode (new RequestResponse($errMsg==null,$errMsg)));
}