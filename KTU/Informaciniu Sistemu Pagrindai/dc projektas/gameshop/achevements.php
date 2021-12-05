<!DOCTYPE html>
<?php session_start(); ?>
<html>
	<head>
		<title>Game shop</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	<head>
	
	<body>
		<div class= "title">
			<a href ="index.php"> GAME SHOP </a>
		</div>
		<div>		
			<?php
				if(isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true){
					$username = $_SESSION['username'];
					if($_SESSION['user_level'] == 1){
						echo "
						<div class=\"llu\">
							<a href=\"cart.php\"> Krepšelis </a>
							<a href=\"profile.php\"> $username </a>
							<a href=\"logout.php\"> Logout </a>
						</div>
						";
					}
					elseif($_SESSION['user_level'] == 2){
						echo "
						<div class=\"llu\">
							<a href=\"admin.php\"> Admin </a>
							<a href=\"profile.php\"> $username </a>
							<a href=\"logout.php\"> Logout </a>
						</div>
						";
					}
					elseif($_SESSION['user_level'] == 3){
						echo "
						<div class=\"llu\">
							<a href=\"buhalter.php\"> Buhalter stuff </a>
							<a href=\"profile.php\"> $username </a>
							<a href=\"logout.php\"> Logout </a>
						</div>
						";
					}
				}else{
					echo "
						<div class=\"llu\">
							<a href=\"login.php\"> Login </a>
							<a href=\"register.php\"> Register </a>
						</div>
					";
				}
			?>
			</div>
						
			<div class=\"achevements\">
				<div class=\"achement\">
					<img src=\"https://image.shutterstock.com/image-vector/business-goal-achievement-vector-concept-260nw-609948158.jpg\">
					<a>Achevement 1 </a>
				</div>
				<div class=\"achement\">
					<img src=\"https://image.shutterstock.com/image-vector/business-goal-achievement-vector-concept-260nw-609948158.jpg\">
					<a>Achevement 2 </a>
				</div>
				<div class=\"achement\">
					<img src=\"https://image.shutterstock.com/image-vector/business-goal-achievement-vector-concept-260nw-609948158.jpg\">
					<a>Achevement 3 </a>
				</div>
			</div>
		
	</body>
</html>