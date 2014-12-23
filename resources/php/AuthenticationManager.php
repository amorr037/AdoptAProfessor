<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AuthenticationManager
 *
 * @author ayme
 */
class AuthenticationManager {

    private $dbCnx;

    function __construct() {
        $contents = file_get_contents("../dbCredentials");
        $config = json_decode($contents);
        $uname = $config->username;
        $pw = $config->password;
        $dbname = $config->dbName;
        $dbAddress = $config->dbAddress;
        $this->dbCnx = new mysqli($dbAddress, $uname, $pw,$dbname);
        if($this->dbCnx->connect_errno>0)
             die("Unable to connect to database[" . $this->dbCnx->connect_error . "]");
    }

    function registerUser($username, $userPwd) {
        $pwdHash = password_hash($userPwd, PASSWORD_DEFAULT);
        $query = "INSERT INTO users (username,password) VALUES ('$username','$pwdHash')";
        if(!$this->dbCnx->query($query))
            return "User already exists";
        return null;
    }

}
