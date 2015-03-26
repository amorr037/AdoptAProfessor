<?php

class RequestResponse {

    public $sucess;
    public $msg;

    function __construct($success, $msg) {
        $this->sucess = $success;
        $this->msg = $msg;
    }

}

class GetProfileInfoResponse extends RequestResponse{
    public $info;
    public function __construct($success,$msg,$info){
        parent::__construct($success, $msg);
        $this->info = $info;
    }
}
