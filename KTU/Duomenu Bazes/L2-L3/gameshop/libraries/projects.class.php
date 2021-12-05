<?php
/**
 * Automobilių modelių redagavimo klasė
 *
 * @author ISK
 */

class projects {
	
	private $kurejai_lentele = '';
	private $projektai_lentele = '';
	private $zaidimai_lentele = '';
	
	public function __construct() {
		$this->kurejai_lentele = config::DB_PREFIX . 'kurejai';
		$this->projektai_lentele = config::DB_PREFIX . 'projektai';
		$this->zaidimai_lentele = config::DB_PREFIX . 'zaidimai';
	}
	
	/**
	 * projekto išrinkimas
	 * @param type $id
	 * @return type
	 */
	public function getModel($id) {
		$query = "  SELECT *
					FROM `{$this->projektai_lentele}`
					WHERE `id`='{$id}'";
		$data = mysql::select($query);
		
		return $data[0];
	}
	
	/**
	 * projektu sąrašo išrinkimas
	 * @param type $limit
	 * @param type $offset
	 * @return type
	 */
	public function getModelList($limit = null, $offset = null) {
		$limitOffsetString = "";
		if(isset($limit)) {
			$limitOffsetString .= " LIMIT {$limit}";
			
			if(isset($offset)) {
				$limitOffsetString .= " OFFSET {$offset}";
			}	
		}
		
		$query = "  SELECT `{$this->projektai_lentele}`.`id`,
						   `{$this->projektai_lentele}`.`pavadinimas`,
						    `{$this->kurejai_lentele}`.`pavadinimas` AS `kurejas`
					FROM `{$this->projektai_lentele}`
						LEFT JOIN `{$this->kurejai_lentele}`
							ON `{$this->projektai_lentele}`.`fk_kurejas`=`{$this->kurejai_lentele}`.`id`{$limitOffsetString}";
		$data = mysql::select($query);
		
		return $data;
	}

	/**
	 * projektu kiekio radimas
	 * @return type
	 */
	public function getModelListCount() {
		$query = "  SELECT COUNT(`{$this->projektai_lentele}`.`id`) as `kiekis`
					FROM `{$this->projektai_lentele}`
						LEFT JOIN `{$this->kurejai_lentele}`
							ON `{$this->projektai_lentele}`.`fk_kurejas`=`{$this->kurejai_lentele}`.`id`";
		$data = mysql::select($query);
		
		return $data[0]['kiekis'];
	}
	
	/**
	 * projektu isrinkimas pagal kureja
	 * @param type $brandId
	 * @return type
	 */
	public function getModelListByBrand($brandId) {
		$query = "  SELECT *
					FROM `{$this->projektai_lentele}`
					WHERE `fk_kurejas`='{$brandId}'";
		$data = mysql::select($query);
		
		return $data;
	}
	
	/**
	 * projekto atnaujinimas
	 * @param type $data
	 */
	public function updateModel($data) {
		$query = "  UPDATE `{$this->projektai_lentele}`
					SET    `pavadinimas`='{$data['pavadinimas']}',
						   `fk_kurejas`='{$data['fk_kurejas']}'
					WHERE `id`='{$data['id']}'";
		mysql::query($query);
	}
	
	/**
	 * projekto įrašymas
	 * @param type $data
	 */
	public function insertModel($data) {
		$query = "  INSERT INTO `{$this->projektai_lentele}`
								(
									`pavadinimas`,
									`fk_kurejas`
								)
								VALUES
								(
									'{$data['pavadinimas']}',
									'{$data['fk_kurejas']}'
								)";
		mysql::query($query);
	}
	
	/**
	 * projekto šalinimas
	 * @param type $id
	 */
	public function deleteModel($id) {
		$query = "  DELETE FROM `{$this->projektai_lentele}`
					WHERE `id`='{$id}'";
		mysql::query($query);
	}
	
	/**
	 * Nurodyto modelio automobilių kiekio radimas
	 * @param type $id
	 * @return type
	 */
	public function getCarCountOfModel($id) {
		$query = "  SELECT COUNT(`{$this->zaidimai_lentele}`.`id`) AS `kiekis`
					FROM `{$this->projektai_lentele}`
						INNER JOIN `{$this->zaidimai_lentele}`
							ON `{$this->projektai_lentele}`.`id`=`{$this->zaidimai_lentele}`.`fk_projektas`
					WHERE `{$this->projektai_lentele}`.`id`='{$id}'";
		$data = mysql::select($query);
		
		return $data[0]['kiekis'];
	}
	
	
}