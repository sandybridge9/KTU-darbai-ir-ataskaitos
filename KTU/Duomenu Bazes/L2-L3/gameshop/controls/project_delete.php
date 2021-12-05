<?php

include 'libraries/projects.class.php';
$modelsObj = new projects();

if(!empty($id)) {
	// patikriname, ar šalinamas projektas nenaudojamas, t.y. nepriskirtas jokiam zaidimui
	$count = $modelsObj->getCarCountOfModel($id);

	$removeErrorParameter = '';
	if($count == 0) {
		// pašaliname modelį
		$modelsObj->deleteModel($id);
	} else {
		// nepašalinome, nes projektas priskirtas bent vienam zaidimui, rodome klaidos pranešimą
		$removeErrorParameter = '&remove_error=1';
	}

	// nukreipiame į modelių puslapį
	header("Location: index.php?module={$module}&action=list{$removeErrorParameter}");
	die();
}

?>