<?php

$conn = new PDO('mysql:host=localhost;dbname=comp', 'root', '');

    if($conn === false){
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }

$processor = $_POST["processor"];

$sth = $conn->prepare('SELECT netname FROM computer WHERE FID_Processor = (SELECT id_processor FROM processor WHERE name = ?)');
$sth->execute(array($processor));
$res = $sth->fetchAll();

    foreach ($res as $row) {
        echo($row[0]);
    }
?>