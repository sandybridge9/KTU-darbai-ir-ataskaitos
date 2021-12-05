<?php

include 'libraries/games.class.php';
$carsObj = new games();

include 'libraries/creators.class.php';
$brandsObj = new creators();

include 'libraries/projects.class.php';
$modelsObj = new projects();

$formErrors = null;
$data = array();

// nustatome privalomus laukus
$required = array('projektas', 'isleidimo_data', 'zanras', 'kontroleris', 'os', 'rekomenduojamas_amzius', 'stadija', 'zaideju_skaicius', 'verte');

// maksimalūs leidžiami laukų ilgiai
$maxLengths = array (
	'zaideju_skaicius' => 9999
);

// vartotojas paspaudė išsaugojimo mygtuką
if(!empty($_POST['submit'])) {
	// nustatome laukų validatorių tipus
	$validations = array (
		'projektas' => 'positivenumber',
		'isleidimo_data' => 'date',
		'zanras' => 'positivenumber',
		'kontroleris' => 'positivenumber',
		'os' => 'positivenumber',
		'rekomenduojamas_amzius' => 'positivenumber',
		'stadija' => 'positivenumber',
		'zaideju_skaicius' => 'positivenumber',
		'verte' => 'price'
		);

	// sukuriame laukų validatoriaus objektą
	include 'utils/validator.class.php';
	$validator = new validator($validations, $required, $maxLengths);

	// laukai įvesti be klaidų
	if($validator->validate($_POST)) {
		// suformuojame laukų reikšmių masyvą SQL užklausai
		$dataPrepared = $validator->preparePostFieldsForSQL();

		// sutvarkome checkbox reikšmes
		if(isset($dataPrepared['multiplayer']) && $dataPrepared['multiplayer'] == 'on') {
			$dataPrepared['multiplayer'] = 1;
		} else {
			$dataPrepared['multiplayer'] = 0;
		}

		if(isset($dataPrepared['coop']) && $dataPrepared['coop'] == 'on') {
			$dataPrepared['coop'] = 1;
		} else {
			$dataPrepared['coop'] = 0;
		}

		// atnaujiname duomenis
		$carsObj->updateCar($dataPrepared);

		// nukreipiame vartotoją į automobilių puslapį
		header("Location: index.php?module={$module}&action=list");
		die();
	} else {
		// gauname klaidų pranešimą
		$formErrors = $validator->getErrorHTML();
		// laukų reikšmių kintamajam priskiriame įvestų laukų reikšmes
		$data = $_POST;
	}
} else {
	// išrenkame elemento duomenis ir jais užpildome formos laukus.
	$data = $carsObj->getCar($id);
}

// įtraukiame šabloną
include 'templates/game_form.tpl.php';

?>