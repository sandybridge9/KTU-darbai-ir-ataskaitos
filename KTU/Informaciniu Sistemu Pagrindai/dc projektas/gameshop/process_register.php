<?php
	// connect to db
	$db = mysqli_connect("localhost", "root", "", "gameshop") or die("Unable to connect to db");
	
	$name = $_POST['name'];
	$surname = $_POST['surname'];
	$bday = $_POST['bday'];
	$username = $_POST['username'];
	$email = $_POST['email'];
	$password = $_POST['password'];

	$resutl = mysqli_query($db, "INSERT INTO users (id, user_level, vardas, pavarde, gimimo_data, username, password, email)
	VALUES ('NULL', '1', '$name', '$surname', '$bday', '$username', '$password', '$email')");
	header('Location: http://localhost/gameshop/index.php');

?>