<ul id="pagePath">
	<li><a href="index.php">Pradžia</a></li>
	<li>Projektai</li>
</ul>
<div id="actions">
	<a href='index.php?module=<?php echo $module; ?>&action=create'>Naujas projektas</a>
</div>
<div class="float-clear"></div>

<?php if(isset($_GET['remove_error'])) { ?>
	<div class="errorBox">
		Projektas nebuvo pašalintas. Pirmiausia pašalinkite to projekto zaidimus.
	</div>
<?php } ?>

<table class="listTable">
	<tr>
		<th>ID</th>
		<th>Kurejas</th>
		<th>Projektas</th>
		<th></th>
	</tr>
	<?php
		// suformuojame lentelę
		foreach($data as $key => $val) {
			echo
				"<tr>"
					. "<td>{$val['id']}</td>"
					. "<td>{$val['kurejas']}</td>"
					. "<td>{$val['pavadinimas']}</td>"
					. "<td>"
						. "<a href='#' onclick='showConfirmDialog(\"{$module}\", \"{$val['id']}\"); return false;' title=''>šalinti</a>&nbsp;"
						. "<a href='index.php?module={$module}&action=edit&id={$val['id']}' title=''>redaguoti</a>"
					. "</td>"
				. "</tr>";
		}
	?>
</table>

<?php
	// įtraukiame puslapių šabloną
	include 'templates/paging.tpl.php';
?>