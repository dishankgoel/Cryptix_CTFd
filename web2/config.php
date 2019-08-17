<?php

// define('DB_SERVER', '0.0.0.0:8086');
// define('DB_USERNAME', 'root');
// define('DB_PASSWORD', '.sweetpwd.');
// define('DB_NAME', 'web2');

// $link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

// if($link == false){
//     die("ERROR: Could not connect. " . mysqli_connect_error());
// }
$conn = new mysqli("mysql", "root", ".sweetpwd.", "web2");
if($conn->connect_error){
    die("Connection falied:  " . $conn->connect_error);
}

?>