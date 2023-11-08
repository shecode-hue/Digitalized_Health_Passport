<?php 

header("Access-Control-Allow-Origin: *");

//MySql server and database info
$servername =  "localhost";
$username = "";
$password = "";
$dbname = "";

//connecting to database
$conn = mysqli_connect($servername, $username, $password, $dbname);
?>