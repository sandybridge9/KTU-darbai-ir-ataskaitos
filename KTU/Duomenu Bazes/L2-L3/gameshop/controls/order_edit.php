<?php

include 'libraries/orders.class.php';
$contractsObj = new orders();

include 'libraries/services.class.php';
$servicesObj = new services();

include 'libraries/games.class.php';
$carsObj = new games();

include 'libraries/employees.class.php';
$employeesObj = new employees();

include 'libraries/customers.class.php';
$customersObj = new customers();

$formErrors = null;
$data = array();

// nustatome privalomus laukus
$required = array('nr', 'uzsakymo_data', 'kaina', 'busena', 'fk_klientas', 'fk_darbuotojas', 'fk_zaidimas', 'fk_pirkimo_vieta', 'fk_apmokejimo_vieta', 'kiekiai');

// vartotojas paspaudė išsaugojimo mygtuką
if(!empty($_POST['submit'])) {
	include 'utils/validator.class.php';

	// nustatome laukų validatorių tipus
	$validations = array (
		'nr' => 'positivenumber',
		'uzsakymo_data' => 'date',
		'kaina' => 'price',
		'busena' => 'positivenumber',
		'fk_klientas' => 'positivenumber',
		'fk_darbuotojas' => 'positivenumber',
		'fk_zaidimas' => 'positivenumber',
		'fk_pirkimo_vieta' => 'positivenumber',
		'fk_apmokejimo_vieta' => 'positivenumber',
		'kiekiai' => 'int');

	// sukuriame laukų validatoriaus objektą
	$validator = new validator($validations, $required);

	// laukai įvesti be klaidų
	if($validator->validate($_POST)) {
		// suformuojame laukų reikšmių masyvą SQL užklausai
		$dataPrepared = $validator->preparePostFieldsForSQL();

		// atnaujiname sutartį
		$contractsObj->updateContract($dataPrepared);

		// atnaujiname užsakytas paslaugas
		$contractsObj->updateOrderedServices($dataPrepared);

		// nukreipiame vartotoją į sutarčių puslapį
		if($formErrors == null) {
			header("Location: index.php?module={$module}&action=list");
			die();
		}
	} else {
		// gauname klaidų pranešimą
		$formErrors = $validator->getErrorHTML();

		// laukų reikšmių kintamajam priskiriame įvestų laukų reikšmes
		$data = $_POST;
		if(isset($_POST['kiekiai']) && sizeof($_POST['kiekiai']) > 0) {
			$i = 0;
			foreach($_POST['kiekiai'] as $key => $val) {
				$data['uzsakytos_paslaugos'][$i]['kiekis'] = $val;
				$i++;
			}
		}
	}
} else {
	//  išrenkame elemento duomenis ir jais užpildome formos laukus.
	$data = $contractsObj->getContract($id);
	$data['uzsakytos_paslaugos'] = $contractsObj->getOrderedServices($id);
}

// nustatome požymį, kad įrašas redaguojamas norint išjungti ID redagavimą šablone
$data['editing'] = 1;

// įtraukiame šabloną
include 'templates/order_form.tpl.php';

?>