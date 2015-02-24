<?php

$uname = "root";
$pw = "123";
$dbname = "adoptaprof";
$dbAddress = "localhost";
$conn = new mysqli($dbAddress, $uname, $pw, $dbname);

if ($conn->connect_error)
    die("Connection failed: " . $conn->connect_error);


if ($result = $conn->query("SELECT username, firstname, lastname, title, website, email FROM users LIMIT 10")) {
    $i = 0;
    while($row = $result->fetch_array(MYSQL_ASSOC)){
        $res[$i] = $row;
        $i++;
    }

    echo json_encode($res);

    /* free result set */
    $result->close();
}
