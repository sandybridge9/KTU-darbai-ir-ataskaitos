<?php

include 'libraries/games.class.php';
$carsObj = new games();

if(!empty($id)) {
	// patikriname, ar zaidimas neįtrauktas į uzsakymus
	$count = $carsObj->getContractCountOfCar($id);

	$removeErrorParameter = '';
	if($count == 0) {
		// šaliname zaidima
		$carsObj->deleteCar($id);
	} else {
		// nepašalinome, nes zaidimas įtrauktas bent į vieną uzsakyma, rodome klaidos pranešimą
		$removeErrorParameter = '&remove_error=1';
	}

	// nukreipiame į zaidimu puslapį
	header("Location: index.php?module={$module}&action=list{$removeErrorParameter}");
	die();
}

?>