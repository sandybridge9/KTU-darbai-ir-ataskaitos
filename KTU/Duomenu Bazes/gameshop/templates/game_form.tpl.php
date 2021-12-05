<ul id="pagePath">
	<li><a href="index.php">Pradžia</a></li>
	<li><a href="index.php?module=<?php echo $module; ?>&action=list">Zaidimai</a></li>
	<li><?php if(!empty($id)) echo "Zaidimo redagavimas"; else echo "Naujas zaidimas"; ?></li>
</ul>
<div class="float-clear"></div>
<div id="formContainer">
	<?php if($formErrors != null) { ?>
		<div class="errorBox">
			Neįvesti arba neteisingai įvesti šie laukai:
			<?php 
				echo $formErrors;
			?>
		</div>
	<?php } ?>
	<form action="" method="post">
		<fieldset>
			<legend>Zaidimo informacija</legend>
			<p>
				<label class="field" for="projektas">Projektas<?php echo in_array('projektas', $required) ? '<span> *</span>' : ''; ?></label>
				<select id="projektas" name="projektas">
					<option value="-1">---------------</option>
					<?php
						// išrenkame visas kategorijas sugeneruoti pasirinkimų lauką
						$brands = $brandsObj->getBrandList();
						foreach($brands as $key => $val) {
							echo "<optgroup label='{$val['pavadinimas']}'>";

							$models = $modelsObj->getModelListByBrand($val['id']);
							foreach($models as $key2 => $val2) {
								$selected = "";
								if(isset($data['projektas']) && $data['projektas'] == $val2['id']) {
									$selected = " selected='selected'";
								}
								echo "<option{$selected} value='{$val2['id']}'>{$val2['pavadinimas']}</option>";
							}
						}
					?>
				</select>
			</p>
			<p>
				<label class="field" for="pagaminimo_data">isleidimo_data<?php echo in_array('isleidimo_data', $required) ? '<span> *</span>' : ''; ?></label>
				<input type="text" id="isleidimo_data" name="isleidimo_data" class="textbox textbox-70 date" value="<?php echo isset($data['isleidimo_data']) ? $data['isleidimo_data'] : ''; ?>"></p>
			<p>
				<label class="field" for="zanras">zanras<?php echo in_array('zanras', $required) ? '<span> *</span>' : ''; ?></label>
				<select id="zanras" name="zanras">
					<option value="-1">---------------</option>
					<?php
						// išrenkame visas kategorijas sugeneruoti pasirinkimų lauką
						$gearboxes = $carsObj->getGearboxList();
						foreach($gearboxes as $key => $val) {
							$selected = "";
							if(isset($data['zanras']) && $data['zanras'] == $val['id']) {
								$selected = " selected='selected'";
							}
							echo "<option{$selected} value='{$val['id']}'>{$val['name']}</option>";
						}
					?>
				</select>
			</p>
			<p>
				<label class="field" for="kontroleris">kontroleris<?php echo in_array('kontroleris', $required) ? '<span> *</span>' : ''; ?></label>
				<select id="kontroleris" name="kontroleris">
					<option value="-1">---------------</option>
					<?php
						// išrenkame visas kategorijas sugeneruoti pasirinkimų lauką
						$fueltypes = $carsObj->getFuelTypeList();
						foreach($fueltypes as $key => $val) {
							$selected = "";
							if(isset($data['kontroleris']) && $data['kontroleris'] == $val['id']) {
								$selected = " selected='selected'";
							}
							echo "<option{$selected} value='{$val['id']}'>{$val['name']}</option>";
						}
					?>
				</select>
			</p>
			<p>
				<label class="field" for="os">os<?php echo in_array('os', $required) ? '<span> *</span>' : ''; ?></label>
				<select id="os" name="os">
					<option value="-1">---------------</option>
					<?php
						// išrenkame visas kategorijas sugeneruoti pasirinkimų lauką
						$bodytypes = $carsObj->getBodyTypeList();
						foreach($bodytypes as $key => $val) {
							$selected = "";
							if(isset($data['os']) && $data['os'] == $val['id']) {
								$selected = " selected='selected'";
							}
							echo "<option{$selected} value='{$val['id']}'>{$val['name']}</option>";
						}
					?>
				</select>
			</p>
			<p>
				<label class="field" for="rekomenduojamas_amzius">rekomenduojamas_amzius<?php echo in_array('rekomenduojamas_amzius', $required) ? '<span> *</span>' : ''; ?></label>
				<select id="rekomenduojamas_amzius" name="rekomenduojamas_amzius">
					<option value="-1">---------------</option>
					<?php
						// išrenkame visas kategorijas sugeneruoti pasirinkimų lauką
						$lugage = $carsObj->getLugageTypeList();
						foreach($lugage as $key => $val) {
							$selected = "";
							if(isset($data['rekomenduojamas_amzius']) && $data['rekomenduojamas_amzius'] == $val['id']) {
								$selected = " selected='selected'";
							}
							echo "<option{$selected} value='{$val['id']}'>{$val['name']}</option>";
						}
					?>
				</select>
			</p>
			<p>
				<label class="field" for="multiplayer">Multiplayer</label>
				<input type="checkbox" id="multiplayer" name="multiplayer"<?php echo (isset($data['multiplayer']) && ($data['multiplayer'] == 1 || $data['multiplayer'] == 'on'))  ? ' checked="checked"' : ''; ?>>
			</p>
			<p>
				<label class="field" for="coop">coop</label>
				<input type="checkbox" id="coop" name="coop"<?php echo (isset($data['coop']) && ($data['coop'] == 1 || $data['coop'] == 'on'))  ? ' checked="checked"' : ''; ?>>
			</p>
                        <p>
				<label class="field" for="stadija">stadija<?php echo in_array('stadija', $required) ? '<span> *</span>' : ''; ?></label>
				<select id="stadija" name="stadija">
					<option value="-1">---------------</option>
					<?php
						// išrenkame visas kategorijas sugeneruoti pasirinkimų lauką
						$car_states = $carsObj->getCarStateList();
						foreach($car_states as $key => $val) {
							$selected = "";
							if(isset($data['stadija']) && $data['stadija'] == $val['ID']) {
								$selected = " selected='selected'";
							}
							echo "<option{$selected} value='{$val['ID']}'>{$val['name']}</option>";
						}
					?>
				</select>
			</p>
			<p>
				<label class="field" for="zaideju_skaicius">Zaideju skaicius<?php echo in_array('zaideju_skaicius', $required) ? '<span> *</span>' : ''; ?></label>
				<input type="text" id="zaideju_skaicius" name="zaideju_skaicius" class="textbox textbox-30" value="<?php echo isset($data['zaideju_skaicius']) ? $data['zaideju_skaicius'] : ''; ?>">
			</p>
			<p>
				<label class="field" for="verte">Vertė<?php echo in_array('verte', $required) ? '<span> *</span>' : ''; ?></label>
				<input type="text" id="verte" name="verte" class="textbox textbox-70" value="<?php echo isset($data['verte']) ? $data['verte'] : ''; ?>"><span class="units">&euro;</span>
			</p>
		</fieldset>
		<p class="required-note">* pažymėtus laukus užpildyti privaloma</p>
		<p>
			<input type="submit" class="submit button" name="submit" value="Išsaugoti">
		</p>
		<?php if(isset($data['id'])) { ?>
			<input type="hidden" name="id" value="<?php echo $data['id']; ?>" />
		<?php } ?>
	</form>
</div>