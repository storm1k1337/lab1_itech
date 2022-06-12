<?php

$conn = new PDO('mysql:host=localhost; dbname=comp', 'root', '');

    if($conn === false){
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }

$software = $_POST["software"];

$sth = $conn->prepare('SELECT netname from computer, computer_software, software 
where ID_Computer=FID_Computer and FID_Software=ID_Software and name=?');
$sth->execute(array($software));
$res = $sth->fetchAll();

    foreach ($res as $row) {
        echo($row[0]);
    }
?>