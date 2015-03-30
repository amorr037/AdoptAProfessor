<?php
require_once 'RequestResponse.php';
class CommentsResponse extends RequestResponse{
    public $comments;
    public function __construct($success,$msg,$comments){
        parent::__construct($success, $msg);
        $this->comments = $comments;
    }
}