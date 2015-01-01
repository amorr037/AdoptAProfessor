<?php
class LoginResponse extends RequestResponse{
    public $apiKey;
    public function __construct($success,$msg,$apiKey){
        parent::__construct($success, $msg);
        $this->apiKey = $apiKey;
    }
}