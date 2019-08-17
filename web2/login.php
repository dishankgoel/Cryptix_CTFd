<?php
require_once "config.php";

if($_SERVER["REQUEST_METHOD"] == "POST"){
    if(isset($_POST['username'])){$name = $_POST['username'];}else{echo 'no username';}
    if(isset($_POST['pwd'])){$pass = $_POST['pwd'];}else{echo 'no passwoord';}

    $query = "SELECT * FROM users where name='$name' and password='$pass'";

    $result = $conn->query($query);
    if (!$result){
        die("cannot execute query");
    }else{
        $row = $result->fetch_assoc();
        if($row){
            echo "Welcome!" . "<br><br>";
            echo "Name: " . $row['name'] . ",<br>";
            // echo "Password: " . $row['password'];
            echo "Here is your flag: flag{s1mpl3_5QL_1nj3cti0n}";
        }
        else{
            echo "Wrong username or password";
        }
    }

}


?>