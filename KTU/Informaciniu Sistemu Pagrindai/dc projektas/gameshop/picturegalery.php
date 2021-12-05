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
			<div class="pictures-galery">
			
				<table>
					<tr>
						<th>
							<div class="picture">
						<img src="https://image.freepik.com/free-photo/cute-cat-picture_1122-449.jpg">
					</div>
						</th>
						<th>
							<div class="picture">
						<img src="https://cdn2.hercampus.com/hero-images/2018/09/07/maxresdefault-1.jpg">
					</div>
						</th>
						<th>
							<div class="picture">
						<img src="https://thumbs-prod.si-cdn.com/c86on9yeBmn5_G7b4ng_ZQWjiII=/800x600/filters:no_upscale()/https://public-media.smithsonianmag.com/filer/d6/93/d6939718-4e41-44a8-a8f3-d13648d2bcd0/c3npbx.jpg">
					</div>
						</th>
					</tr>
				</table>
			
			</div>
			
		</div>
		
	</body>
</html>