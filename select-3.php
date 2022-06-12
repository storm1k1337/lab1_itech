<?php

$conn = new PDO('mysql:host=localhost; dbname=comp', 'root', '');

    if($conn === false){
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }

$data = $_POST["udate"];

$sth = $conn->prepare('SELECT netname FROM computer where ? > (DATE_ADD(date_purchase, INTERVAL guarantee MONTH))');
$sth->execute(array($data));
$res = $sth->fetchAll();
    foreach ($res as $row) {
        echo($row[0]);
    }
?>