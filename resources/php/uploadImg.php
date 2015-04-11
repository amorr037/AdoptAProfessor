<?php

if(isset($_FILES['file'])){
    //The error validation could be done on the javascript client side.
    $file_data = $_FILES['file'];
    $file_name = $file_data['name'];
    $file_size =$file_data['size'];
    $file_tmp =$file_data['tmp_name'];
    $file_type=$file_data['type'];
    $file_name = time().$file_name;
    move_uploaded_file($file_tmp,"../img/uploaded/$file_name");
    echo json_encode(array("success" => true, "path" => "resources/img/uploaded/$file_name"));
}