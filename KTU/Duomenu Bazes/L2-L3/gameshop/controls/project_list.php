<?php

// sukuriame projects klasės objektą
include 'libraries/projects.class.php';
$modelsObj = new projects();

// suskaičiuojame bendrą įrašų kiekį
$elementCount = $modelsObj->getModelListCount();

// sukuriame puslapiavimo klasės objektą
include 'utils/paging.class.php';
$paging = new paging(config::NUMBER_OF_ROWS_IN_PAGE);

// suformuojame sąrašo puslapius
$paging->process($elementCount, $pageId);

// išrenkame nurodyto puslapio modelius
$data = $modelsObj->getModelList($paging->size, $paging->first);

// įtraukiame šabloną
include 'templates/project_list.tpl.php';
	
?>