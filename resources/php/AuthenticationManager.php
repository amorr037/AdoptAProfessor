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

    function registerUser($username, $userPwd, $email, $fname, $lname, $usertype) {
        $pwdHash = password_hash($userPwd, PASSWORD_DEFAULT);
        $stmt = $this->dbCnx->prepare
        ("INSERT INTO users (username, password,email,firstname, lastname, usertype) VALUES (?, ?, ?, ?, ?,?)");
        if (!$stmt) {
            return "Unable to prepare insertion query";
        }
        $stmt->bind_param("ssssss", $username, $pwdHash, $email, $fname, $lname, $usertype);
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
        if ($result = $this->dbCnx->query("SELECT firstname, lastname, email, usertype, status, profileimg  FROM users WHERE username = '$username'")) {
            $row = $result->fetch_assoc();
            if($row){
                $res['errMsg']=null;
                $res['firstname']= $row['firstname'];
                $res['lastname']= $row['lastname']; 
                $res['email']= $row['email']; 
                $res['usertype'] = $row['usertype'];
                $res['status'] = $row['status'];
                $res['profileImgPath'] = $row['profileimg'];
                return $res;             
            }
            $result->close();
            $res['errMsg']="Username not found";
             return $res;
        }
        $res['errMsg'] = $result;
        return $res; 
    }
    function getProfessors() {
//        $res = ["errMsg" => null, "username" => null, "title" => null, "website" => null,
//            "email" => null, "firstname" => null, "lastname" => null, "path" => null,
//            "user_id" => null ];
        if ($result = $this->dbCnx->query(
            "SELECT firstname, lastname, username, email, profileimg
            FROM users
            WHERE users.usertype = 'PROFESSOR'")) {

            $i = 0;
            while ($row = $result->fetch_assoc()) {
                $res[$i]['email']= $row['email'];
                $res[$i]['username']= $row['username'];
                $res[$i]['profileimg']= $row['profileimg'];
                $res[$i]['lastname']= $row['lastname'];
                $res[$i]['firstname']= $row['firstname'];
                $i++;
            }
            $result->close();
//            $res['errMsg']="Tehre was an error.";
//             return $res;
        }
//        $res['errMsg'] = $result;
        return $res;
    }
    function getProfessorComments($professorUsername){
        $query = <<< _SQL_
        SELECT A.comment_id as commentId,
        A.text as content,
        A.fromUserId as userId,
        A.imageurl as imageurl,
        A.time as time,
        C.profileimg as profileimg,
        C.username as username,
        C.firstname as firstname,
        C.lastname as lastname
        FROM comments A, users B, users C
        WHERE B.username = '$professorUsername'
        and C.user_id = A.fromUserId
        and A.toUserId = B.user_id
        Order By A.time DESC
_SQL_;
        $res = ["errMsg" => null, 'comments'=>[]];
        if ($result = $this->dbCnx->query($query)) {
            while($row = $result->fetch_assoc()) {
                $user = ['username'=>null,'firstname'=>null,'lastname'=>null,'profileimg'=>null];
                if ($row) {
                    $user['username'] = $row['username'];
                    $user['firstname'] = $row['firstname'];
                    $user['lastname'] = $row['lastname'];
                    $user['profileimg'] = $row['profileimg'];
                }
                $comment = ['commentId'=>null,'content'=>null, 'imageurl'=>null, 'time'=>null, 'from'=>$user];
                $comment['commentId'] = $row['commentId'];
                $comment['content'] = $row['content'];
                $comment['imageurl'] = $row['imageurl'];
                $comment['time'] = $row['time'];
                array_push($res['comments'],$comment);
            }
            $result->close();
        }else $res['errMsg'] = "Error getting comments from the database";
        return $res;
    }
    function getStudentComments($studentUsername){
        $query = <<< _SQL_
        SELECT A.comment_id as commentId,
        A.text as content,
        A.fromUserId as userId,
        A.imageurl as imageurl,
        A.time as time,
        C.profileimg as profileimg,
        C.username as username,
        C.firstname as firstname,
        C.lastname as lastname
        FROM comments A, users B, users C
        WHERE B.username = '$studentUsername'
        and C.user_id = A.toUserId
        and A.fromUserId = B.user_id
        Order By A.time DESC
_SQL_;
        $res = ["errMsg" => null, 'comments'=>[]];
        if ($result = $this->dbCnx->query($query)) {
            while($row = $result->fetch_assoc()) {
                $user = ['username'=>null,'firstname'=>null,'lastname'=>null,'profileimg'=>null];
                if ($row) {
                    $user['username'] = $row['username'];
                    $user['firstname'] = $row['firstname'];
                    $user['lastname'] = $row['lastname'];
                    $user['profileimg'] = $row['profileimg'];
                }
                $comment = ['commentId'=>null,'content'=>null, 'imageurl'=>null, 'time'=>null, 'from'=>$user];
                $comment['commentId'] = $row['commentId'];
                $comment['content'] = $row['content'];
                $comment['imageurl'] = $row['imageurl'];
                $comment['time'] = $row['time'];
                array_push($res['comments'],$comment);
            }
            $result->close();
        }else $res['errMsg'] = "Error getting comments from the database";
        return $res;
    }
    function getUserId($username)
    {
        $query = <<<_SQL_
        SELECT user_id
        from users
        where username = '$username';
_SQL_;
        if ($result = $this->dbCnx->query($query)) {
            if($row = $result->fetch_assoc()){
                return $row['user_id'];
            }
        } else return null;
    }
    function reportComment($username,$commentid){
        $userId = $this->getUserId($username);
        if(!$userId){
            return "Username not found";
        }
        $query = <<<_SQL_
        INSERT into commentReports (commentId, reporterId)
        VALUES ($commentid,$userId);
_SQL_;
        if ($result = $this->dbCnx->query($query)) {
            return null;
        } else return "We have encountered problems reporting the comment.";
    }
    function deleteComment($commentid){
        if($this->deleteFromReportedComments($commentid)!=null){
            $query = <<<_SQL_
        DELETE from comments
        WHERE comment_id = '$commentid'
_SQL_;
            if ($result = $this->dbCnx->query($query)) {
                return null;
            }else return "We have encountered problems deleting the comment.";
        }else "We have encountered problems deleting the comment.";
    }
    function deleteFromReportedComments($commentid){
        $query = <<<_SQL_
        DELETE from commentReports
        WHERE comment_id = '$commentid'
_SQL_;
        if ($result = $this->dbCnx->query($query)) {
                return null;
        }else return "We have encountered problems deleting the comment.";
    }
    function updateUserInfo($userName,$firstName,$lastName,$email){
        $query = <<<_SQL
        UPDATE users
        SET firstname='$firstName', lastname='$lastName', email='$email'
        WHERE username = '$userName';
_SQL;
        if ($result = $this->dbCnx->query($query)) {
            return null;
        } else return "We have encountered problems updating new information.";

    }
    function getComment($commentId){
        $query = <<<_SQL
        SELECT *
        FROM comments
        WHERE comment_id = '$commentId';
_SQL;
        $res = ["errMsg" => null, 'comments'=>[]];
        if ($result = $this->dbCnx->query($query)) {
            while($row = $result->fetch_assoc()) {
                $comment = ['commentId'=>null,'content'=>null, 'imageurl'=>null, 'time'=>null, 'from'=>null, 'to'=>null];
                $comment['commentId'] = $row['comment_id'];
                $comment['content'] = $row['text'];
                $comment['imageurl'] = $row['imageurl'];
                $comment['from'] =$row['fromUserId'];
                $comment['to'] = $row['toUserId'];
                $comment['time'] = $row['time'];
                array_push($res['comments'],$comment);
            }
            $result->close();
        } else $res['errMsg'] = "Error getting comments from the database";
        return $res;
    }
    function getReportedCommentsId(){
        $query = <<<_SQL
        SELECT commentId
        FROM commentReports;
_SQL;
        $res = ["errMsg" => null, 'comments'=>[]];
        if ($result = $this->dbCnx->query($query)) {
            while($row = $result->fetch_assoc()) {
                array_push($res['comments'],$row['commentId']);
            }
            $result->close();
        }
        else $res['errMsg'] = "Error getting comments from the database";
        return $res;
    }

    function getReportedCommentsInfo(){
        $commentsId = $this->getReportedCommentsId();
        $res = ["errMsg" => null, 'comments'=>[]];
        if(sizeof($commentsId['comments'])==0){
            return $res;
        }
        else {
            $inClause = $this->formatInClause($this->getReportedCommentsId());
            $query = <<<_SQL
            SELECT *
            FROM comments
            WHERE comment_id IN ('$inClause');
_SQL;
            $res = ["errMsg" => null, 'comments' => []];
            if ($result = $this->dbCnx->query($query)) {
                while ($row = $result->fetch_assoc()) {
                    $comment = ['commentId' => null, 'content' => null, 'imageurl' => null, 'time' => null, 'from' => null, 'to' => null];
                    $comment['commentId'] = $row['comment_id'];
                    $comment['content'] = $row['text'];
                    $comment['imageurl'] = $row['imageurl'];
                    $comment['from'] = $row['fromUserId'];
                    $comment['to'] = $row['toUserId'];
                    $comment['time'] = $row['time'];
                    array_push($res['comments'], $comment);
                }
                $result->close();
            } else $res['errMsg'] = "Error getting comments from the database";
        }
        return $res;
    }
    function formatInClause($array){
        $reportedIds = $array['comments'];
        $inClause = "";
        $first = true;
        foreach ($reportedIds as $value) {
            $inClause= $first? $inClause .$value:  $inClause ."'" .',' ."'" .$value;
            $first=false;
        }
        return $inClause;
    }
    function getProfessorProfileInfo($username) {
        $res = ["errMsg" => null, "username"=>null,"firstname" => null, "lastname" => null, "email" => null,'usertype' => null, 'status'=>null];
        if ($result = $this->dbCnx->query("SELECT username,firstname, lastname, email, profileimg, usertype, status FROM users WHERE username = '$username' AND usertype='PROFESSOR' AND status=1")) {
            $row = $result->fetch_assoc();
            if($row){
                $res['username']= $row['username'];
                $res['firstname']= $row['firstname'];
                $res['lastname']= $row['lastname'];
                $res['email']= $row['email'];
                $res['profileimg']= $row['profileimg'];
                $res['usertype'] = $row['usertype'];
                $res['status'] = $row['status'];
                return $res;
            }
            $result->close();
            $res['errMsg']="Professor not found";
            // return $res;
        }
        $res['errMsg'] = $result;
        return $res;
    }
    function getNotVerifiedProfessors()
    {
        $query = <<<_SQL
            SELECT *
            FROM users
            WHERE usertype = 'PROFESSOR'
            AND status = 0;
_SQL;
        $res = ["errMsg" => null, 'accounts' => []];
        if ($result = $this->dbCnx->query($query)) {
            while ($row = $result->fetch_assoc()) {
                $account = ['userId' => null, 'firstname' => null, 'lastname' => null, 'username' => null, 'email' => null, 'usertype' => null];
                $account['userId'] = $row['user_id'];
                $account['firstname'] = $row['firstname'];
                $account['lastname'] = $row['lastname'];
                $account['username'] = $row['username'];
                $account['email'] = $row['email'];
                $account['usertype'] = $row['usertype'];
                array_push($res['accounts'], $account);
            }
            $result->close();
        } else $res['errMsg'] = "Error getting professors from the database";
        return $res;
    }
    function getUserEmail($username){
        $res = ["errMsg" => null, "email" => null];
        $stmt = $this->getProfileInfo($username);
        if ($stmt['errMsg'] == null) {
            $res['errMsg'] = null;
            $res['email'] = $stmt['email'];
            return $res;
        }
        $res['errMsg'] = $stmt['errMsg'];
        return $stmt['errMsg'];
    }
    function updatePrfImg($username, $imgUrl){
        $stmt = $this->dbCnx->prepare("UPDATE users SET profileimg=? WHERE username=?");
        $stmt->bind_param("ss", $imgUrl, $username);
        $res = $stmt->execute();
        $stmt->close();
        if(!$res)
            return "There was an error updating profile image!";
        return NULL;
    }
    function sendContactUsEmail($email, $name, $comment){
        $admin_email = "contact@adoptaprofessor.org";
        $subject = "Adopt a Professor Email From " . $name . "( " . $email . ")";
        $comment = $comment;
        $admin_personal_email = "adoptProfessor@gmail.com";
        if(mail($admin_personal_email, "$subject", $comment, "From:" . $admin_email)){
          $res['errMsg'] = null;
        }else
            $res['errMsg'] = "Error while sending email!";
        return $res;
    }
    function sendNewGeneratedPassword($username, $email){
            $tempPassword = $this->generateRandomString(6);
            //Email information
            $admin_email = "contact@adoptaprofessor.org";
            $subject = "New Password Request!";
            $comment = "Here is your temporary password: ". $tempPassword ."\nPlease log in to your account and change it.";
            //send email
            if(mail($email, "$subject", $comment, "From:" . $admin_email)){
                $stmt = $this->dbCnx->prepare(" UPDATE users SET password=? WHERE username=?");
                if (!$stmt) {
                    $res['errMsg'] = "Error while saving new password. Please Disregard any email received!";
                    return $res;
                }
                $pwdHash = password_hash($tempPassword, PASSWORD_DEFAULT);
                $stmt->bind_param("ss", $pwdHash, $username);
                $ress = $stmt->execute();
                $stmt->close();
                if (!$ress) {
                    $res['errMsg'] = "Error while saving new password. Please Disregard any email received!";
                    return $res;
                }
                $res['errMsg'] = null;
                return $res;
            }
            $res['errMsg'] = "Error while sending email!";
            return false;
    }
    function sendNewInvitation($emailTo, $message, $fName, $lName){
            //Email information
            $admin_email = "contact@adoptaprofessor.org";
            $subject = "You have an invitation to join Adopt A Professor website";
            $content = "Student " . $fName ." " .$lName . " wants to invite you to join the Adopt a Professor family:
            " . $message ."
             Please click the following link to register \n http://adoptaprofessor.org/index.html#/register";
            //send email
            if(mail($emailTo, "$subject", $content, "From:" . $admin_email)){
                $res['errMsg'] = null;
                return $res;
            }
            $res['errMsg'] = "Error while sending email!";
            return false;
    }

    function changePsswRequest($username, $oldPassword, $newPassword){
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
        if (!password_verify($oldPassword, $pass)) {
            $res['errMsg'] = "Password incorrect";
            return $res;
        }
        $stmt->close();
        $stmt = $this->dbCnx->prepare(" UPDATE users SET password=? WHERE user_id=?");
        if (!$stmt) {
            $res['errMsg'] = "Unable to prepare select query";
            return $res;
        }
        $pwdHash = password_hash($newPassword, PASSWORD_DEFAULT);
        $stmt->bind_param("ss", $pwdHash, $user_id);
        $res = $stmt->execute();
        $stmt->close();
        if (!$res) {
            $res['errMsg'] = "Unable to change password";
            return $res;
        }
    }
    function verifyProfessor($userName){
        $query = <<<_SQL
        UPDATE users
        SET status=1
        WHERE username = '$userName';
_SQL;
        if ($result = $this->dbCnx->query($query)) {
            return null;
        } else return "We have encountered problems updating professor status.";

    }
    function insertComment($from, $to, $text, $imgUrl) {
        $img = $imgUrl==null?'null':"'$imgUrl'";
        echo $imgUrl;
        $fixedText = str_replace("'", "", $text);
        echo $fixedText;
        $query = <<<_SQL
        INSERT INTO comments (text, fromUserId, toUserId, imageurl)
        VALUES ('$fixedText',(SELECT user_id
                        FROM users
                        WHERE username='$from'), (SELECT user_id
                                                    FROM users
                                                    WHERE username='$to'), $img);
_SQL;
        var_dump($query);
        if ($result = $this->dbCnx->query($query)) {
            return null;
        } else return "We have encountered problems inserting the comments.";
    }
    function deleteUser($username){
        $query = <<<_SQL
        DELETE FROM users WHERE username = '$username'
_SQL;
        if ($result = $this->dbCnx->query($query)) {
            return null;
        } else return "We have encountered problems deleting user.";
    }

    function getProfessorOfPreviousMonth($startDate, $endDate){
        $res = ["errMsg" => null, "firstname" => null, "lastname" => null, "email" => null, 'profileimg'=>null, "lastComment" => null, "img" => null];
        if ($result = $this->dbCnx->query("SELECT firstname , lastname , email , profileimg , comments.text as lastComment, comments.imageurl as img
                                            FROM users, comments, ((SELECT PrfWComments.toUserId AS user_id_selected, PrfWComments.latestComment AS comment_id
                                                                    FROM (SELECT toUserId , text , Max( comment_id ) AS latestComment, count(comment_id) AS totalComments
                                                                            FROM comments
                                                                            WHERE comments.time >= '$startDate'
                                                                            AND comments.time < '$endDate'
                                                                            GROUP BY toUserId
                                                                            ORDER BY totalComments DESC) AS PrfWComments
                                                                            LIMIT 1)) AS Result
                                            WHERE users.user_id = Result.user_id_selected
                                            AND comments.comment_id = Result.comment_id")) {
            $row = $result->fetch_assoc();
            if($row){
                $res['errMsg']=null;
                $res['firstname']= $row['firstname'];
                $res['lastname']= $row['lastname'];
                $res['email']= $row['email'];
                $res['profileimg']= $row['profileimg'];
                $res['lastComment']= $row['lastComment'];
                $res['img']= $row['img'];
                return $res;
            }
            $result->close();
            $res['errMsg']="Error getting professor of the month!";
            return $res;
        }
    }
}
