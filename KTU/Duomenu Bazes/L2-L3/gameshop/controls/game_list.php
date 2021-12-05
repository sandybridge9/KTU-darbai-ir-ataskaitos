<?php

// sukuriame automobilių klasės objektą
include 'libraries/games.class.php';
$carsObj = new games();

// suskaičiuojame bendrą įrašų kiekį
$elementCount = $carsObj->getCarListCount();

// sukuriame puslapiavimo klasės objektą
include 'utils/paging.class.php';
$paging = new paging(config::NUMBER_OF_ROWS_IN_PAGE);

// suformuojame sąrašo puslapius
$paging->process($elementCount, $pageId);

// išrenkame nurodyto puslapio automobilius
$data = $carsObj->getCarList($paging->size, $paging->first);	

// įtraukiame šabloną
include 'templates/game_list.tpl.php';

?>