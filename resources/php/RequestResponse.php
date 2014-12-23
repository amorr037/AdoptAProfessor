<?php

/**
 * Description of RequestResponse
 *
 * @author ayme
 */
class RequestResponse {

    public $sucess;
    public $msg;

    function __construct($success, $msg) {
        $this->sucess = $success;
        $this->msg = $msg;
    }

}
