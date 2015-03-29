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
        $contents = file_get_contents("../../../dbCredentials");
        $config = json_decode($contents);
        $uname = $config->username;
        $pw = $config->password;
        $dbname = $config->dbName;
        $dbAddress = $config->dbAddress;
        $this->dbCnx = new mysqli($dbAddress, $uname, $pw, $dbname);
        if ($this->dbCnx->connect_errno > 0)
            die("Unable to connect to database[" . $this->dbCnx->connect_error . "]");
    }

    function registerUser($username, $userPwd, $email, $fname, $lname) {
        $pwdHash = password_hash($userPwd, PASSWORD_DEFAULT);
        $stmt = $this->dbCnx->prepare("INSERT INTO users (username, password,email) VALUES (?, ?, ?)");
        if (!$stmt) {
            return "Unable to prepare insertion query";
        }
        $stmt->bind_param("sss", $username, $pwdHash, $email, $fname, $lname);
        $res = $stmt->execute();
        $stmt->close();
        if (!$res)
            return "User already exists";
        return null;
    }

    function generateRandomString($length) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    function storeAPIKey($user_id, $apiKey) {
        $stmt = $this->dbCnx->prepare("INSERT INTO apiKey (user_id, apiKey) VALUES (?, ?) "
                . "ON DUPLICATE KEY UPDATE apiKey=?, last = now()");
        if (!$stmt) {
            return "Unable to prepare storeAPIKey query";
        }
        $stmt->bind_param("sss", $user_id, $apiKey, $apiKey);
        $res = $stmt->execute();
        $stmt->close();
        if (!$res)
            return "Unable to store apiKey";
        return null;
    }

    function loginUser($username, $userPwd) {
        $res = ["errMsg" => null, "apiKey" => null];
        $stmt = $this->dbCnx->prepare("SELECT user_id, password FROM users WHERE username=?");
        if (!$stmt) {
            $res['errMsg'] = "Unable to prepare select query";
            return $res;
        }
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($user_id, $pass);
        if (!$stmt->fetch()) {
            $res['errMsg'] = "UserName not found";
            return $res;
        }
        if (!password_verify($userPwd, $pass)) {
            $res['errMsg'] = "Password incorrect";
            return $res;
        }
        $stmt->close();
        $key = $this->generateRandomString(100);
        $response = $this->storeAPIKey($user_id, $key);
        if ($response) {
            $res['errMsg'] = $response;
            return $res;
        }
        $res['apiKey'] = $key;
        return $res;
    }

    function checkUsername($username) {
        $stmt = $this->dbCnx->prepare("SELECT user_id FROM users WHERE username=?");
        if (!$stmt) {
            $res['errMsg'] = "Unable to prepare select query";
            return $res;
        }
        $stmt->bind_param("s", $username);
        $res = $stmt->execute();
         
        $stmt->bind_result($user_id);
        if ($stmt->fetch()) 
            return "User already exists";             
        return null;
    }
    function getProfileInfo($username) {
        $res = ["errMsg" => null, "firstname" => null, "lastname" => null, "email" => null,'usertype' => 'STUDENT'];
        if ($result = $this->dbCnx->query("SELECT firstname, lastname, email, usertype FROM users WHERE username = '$username'")) {
            $row = $result->fetch_assoc();
            if($row){
                $res['firstname']= $row['firstname'];
                $res['lastname']= $row['lastname']; 
                $res['email']= $row['email']; 
                $res['usertype'] = $row['usertype'];
                return $res;             
            }
            $result->close();
            $res['errMsg']="Username not found";
            // return $res;
        }
        $res['errMsg'] = $result;
        return $res; 
    }
    function getProfessors() {
//        $res = ["errMsg" => null, "username" => null, "title" => null, "website" => null,
//            "email" => null, "firstname" => null, "lastname" => null, "path" => null,
//            "user_id" => null ];
        if ($result = $this->dbCnx->query(
            "SELECT firstname, lastname, users.user_id, title, website, email, path
            FROM users
            LEFT JOIN pictures
            ON users.user_id=pictures.user_id")) {

            $i = 0;

            while ($row = $result->fetch_assoc()) {
                $res[$i]['title']= $row['title'];
                $res[$i]['email']= $row['email'];
                $res[$i]['website']= $row['website'];
                $res[$i]['path']= $row['path'];
                $res[$i]['lastname']= $row['lastname'];
                $res[$i]['firstname']= $row['firstname'];
                $res[$i]['user_id'] = $row['user_id'];
                $i++;
            }
            $result->close();
//            $res['errMsg']="Username not found";
            // return $res;
        }
//        $res['errMsg'] = $result;
        return $res;
    }

}
