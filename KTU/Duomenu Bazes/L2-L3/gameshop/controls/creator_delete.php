<?php

include 'libraries/creators.class.php';
$brandsObj = new creators();

if(!empty($id)) {
	// patikriname, ar šalinama markė nepriskirta modeliui
	$count = $brandsObj->getModelCountOfBrand($id);

	$removeErrorParameter = '';
	if($count == 0) {
		// šaliname markę
		$brandsObj->deleteBrand($id);
	} else {
		// nepašalinome, nes markė priskirta modeliui, rodome klaidos pranešimą
		$removeErrorParameter = '&remove_error=1';
	}

	// nukreipiame į markių puslapį
	header("Location: index.php?module={$module}&action=list{$removeErrorParameter}");
	die();
}

?>