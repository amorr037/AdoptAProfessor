<?php
require_once 'RequestResponse.php';
class usersAccountsResponse extends RequestResponse{
    public $accounts;
    public function __construct($success,$msg,$accounts){
        parent::__construct($success, $msg);
        $this->accounts = $accounts;
    }
}