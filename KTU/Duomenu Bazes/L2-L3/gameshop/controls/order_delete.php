<?php

include 'libraries/orders.class.php';
$contractsObj = new orders();

if(!empty($id)) {
	// pašaliname užsakytas paslaugas
	$contractsObj->deleteOrderedServices($id);

	// šaliname sutartį
	$contractsObj->deleteContract($id);

	// nukreipiame į sutarčių puslapį
	header("Location: index.php?module={$module}&action=list");
	die();
}

?>