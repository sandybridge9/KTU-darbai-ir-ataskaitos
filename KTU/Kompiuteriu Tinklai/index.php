<?php
	$dbc=mysqli_connect('localhost','stud', 'stud','stud');
	if(!$dbc){die ("Negaliu prisijungti prie MySQL:" .mysqli_error($dbc)); }

	$sql = "SELECT * FROM deividasptasnikas";
    $result = mysqli_query($dbc, $sql);

	echo "<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css\">";
	echo "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>";
	echo "<script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js\"></script>";	
	
	echo "
	<style>
		#zinutes {
 	   		font-family: Arial; border-collapse: collapse; width: 70%;
		}
		#zinutes td {
 	   		border: 1px solid #ddd; padding: 8px;
		}
		#zinutes tr:nth-child(even){background-color: #f2f2f2;}
		#zinutes tr:hover {background-color: #ddd;}
	</style>";

	echo "<center><h3>Zinuciu sistema</h3></center>";
	echo "<table border=\"1\" style=\"margin: 0px auto;\" id=\"zinutes\" class=\"table table-stripped\">";
	while($row = mysqli_fetch_assoc($result))
 	{
      echo "<tr><td>"
		  .$row['id']."</td><td>"
		  .$row['vardas']."</td><td>"
		  .$row['epastas']."</td><td>"
		  .$row['kam']."</td><td>"
		  .$row['data']."</td><td>"
		  .$row['ip']."</td><td>"
		  .$row['zinute']."</td></tr>";  }  
	echo "</table>";

	


	echo "<center><h3>Iveskite nauja zinute</h3></center>";
	echo "<div class=\"container\">
  	<form method='post' action =''>
     <div class=\"form-group col-lg-4\">
          <label for=\"vardas\" class=\"control-label\">Siuntėjo vardas:</label>
          <input name='vardas' type='text' class=\"form-control input-sm\">
      </div>
      <div class=\"form-group col-lg-4\">
          <label for=\"epastas\" class=\"control-label\">Siuntėjo e-paštas:</label>
          <input name='epastas' id=\"epastas\" type='text' class=\"form-control input-sm\">
      </div>
      <div class=\"form-group col-lg-4\">
          <label for=\"kam\" class=\"control-label\">Kam skirta:</label>
          <input name='kam' id=\"kam\" type='text' class=\"form-control input-sm\">
      </div>
      <div class=\"form-group col-lg-12\">
          <label for=\"zinute\" class=\"control-label\">Zinute:</label>
          <textarea name='zinute' class=\"form-control input-sm\"></textarea>
      </div>
      <div class=\"form-group col-lg-2\">
         <input type='submit' name='ok' value='siųsti' class=\"btnbtn-default\">
      </div>
	  
  	</form>
	</div>";
		
	//$sql = "INSERT INTO deividasptasnikas(vardas, epastas, kam, zinute)VALUES($vardas, $epastas, $kam, $zinute)";
	
	//if($btn !=null){
	//if($_POST != null){

	if(isset($_POST['ok'])){
		if(!empty($_POST['vardas']) && !empty($_POST['epastas']) && !empty($_POST['kam']) && !empty($_POST['zinute'])){
		$vardas = $_POST['vardas'];
		$epastas = $_POST['epastas'];
		$kam = $_POST['kam'];
		$data = date("Y-m-d H:m:s");
		$ip = $_SERVER['REMOTE_ADDR'];
		$zinute = $_POST['zinute'];
		$sql = "INSERT INTO deividasptasnikas(vardas, `epastas`, kam, data, ip, zinute)VALUES('$vardas', '$epastas', '$kam', '$data', '$ip', '$zinute')";
		if(mysqli_query($dbc,$sql)) echo "Irasyta"; 
		else die ("Klaida irasant:".mysqli_error($dbc));
		$_POST = null;
		header("Refresh:0");
		}
	}
	

	//$sql = "INSERT INTO deividasptasnikas(vardas, epastas, kam, zinute)VALUES($vardas, $epastas, $kam, $zinute)";

	//echo "<form method='post'>";
	//echo "Siuntejo vardas:<input name='vardas' type='text'><br><br>";
	//echo "Siuntejo e.paštas:<input name='epastas' type='email'><br><br>";
	//echo "Kam skirta: <textarea name='kam'> </textarea><br><br>";
	//echo "Žinutė: <textarea name='zinute'> </textarea><br><br>";
	//echo "<input type='submit' name='ok' value='Patvirtinti'>";
	//echo "</form>";
	
	//echo "Veikia";
?>