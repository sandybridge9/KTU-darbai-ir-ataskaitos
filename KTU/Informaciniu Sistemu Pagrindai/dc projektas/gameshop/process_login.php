<?php

	session_start();
	// values passed via login page
	
	$db = mysqli_connect("localhost", "root", "", "gameshop") or die("Unable to connect to db");
	
	$username = $_POST['username'];
	$password = $_POST['password'];
	
	// prevent mysql injection
	$username = stripcslashes($username);
	$password = stripcslashes($password);
	
	$username = mysqli_real_escape_string($db, $username);
	$password = mysqli_real_escape_string($db, $password);
	
	// connect to the db
	
	$result = mysqli_query($db, "select * from users where username = '$username' and password = '$password'") or die("Unable to find the usser ".mysql_error());
	
	$row = mysqli_fetch_array($result);
	if($row['username' == $username] && $row['password'] = $password){
		echo"login success user level ".$row['user_level'];
		$_SESSION['loggedin'] = true;
		$_SESSION['username'] = $username;
		$_SESSION['user_level'] = $row['user_level'];
		header('Location: http://localhost/gameshop/index.php');
	}else{
		echo"login failed";
		header('Location: http://localhost/gameshop/index.php');
	}

?>