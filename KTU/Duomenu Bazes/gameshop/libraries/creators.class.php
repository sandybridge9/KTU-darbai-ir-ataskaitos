<?php
/**
 * kureju redagavimo klasė
 *
 * @author ISK
 */

class creators {
	
	private $kurejai_lentele = '';
	private $projektai_lentele = '';
	
	public function __construct() {
		$this->kurejai_lentele = config::DB_PREFIX . 'kurejai';
		$this->projektai_lentele = config::DB_PREFIX . 'projektai';
	}
	
	/**
	 * kureju išrinkimas
	 * @param type $id
	 * @return type
	 */
	public function getBrand($id) {
		$query = "  SELECT *
					FROM {$this->kurejai_lentele}
					WHERE `id`='{$id}'";
		$data = mysql::select($query);
		
		return $data[0];
	}
	
	/**
	 * kureju sąrašo išrinkimas
	 * @param type $limit
	 * @param type $offset
	 * @return type
	 */
	public function getBrandList($limit = null, $offset = null) {
		$limitOffsetString = "";
		if(isset($limit)) {
			$limitOffsetString .= " LIMIT {$limit}";
			
			if(isset($offset)) {
				$limitOffsetString .= " OFFSET {$offset}";
			}	
		}
		
		$query = "  SELECT *
					FROM {$this->kurejai_lentele}{$limitOffsetString}";
		$data = mysql::select($query);
		
		return $data;
	}

	/**
	 * kureju kiekio radimas
	 * @return type
	 */
	public function getBrandListCount() {
		$query = "  SELECT COUNT(`id`) as `kiekis`
					FROM {$this->kurejai_lentele}";
		$data = mysql::select($query);
		
		return $data[0]['kiekis'];
	}
	
	/**
	 * Kurejo įrašymas
	 * @param type $data
	 */
	public function insertBrand($data) {
		$query = "  INSERT INTO {$this->kurejai_lentele}
								(
									`pavadinimas`
								)
								VALUES
								(
									'{$data['pavadinimas']}'
								)";
		mysql::query($query);
	}
	
	/**
	 * Kurejo atnaujinimas
	 * @param type $data
	 */
	public function updateBrand($data) {
		$query = "  UPDATE {$this->kurejai_lentele}
					SET    `pavadinimas`='{$data['pavadinimas']}'
					WHERE `id`='{$data['id']}'";
		mysql::query($query);
	}
	
	/**
	 * Kurejo šalinimas
	 * @param type $id
	 */
	public function deleteBrand($id) {
		$query = "  DELETE FROM {$this->kurejai_lentele}
					WHERE `id`='{$id}'";
		mysql::query($query);
	}
	
	/**
	 * Kurejo projektu kiekio radimas
	 * @param type $id
	 * @return type
	 */
	public function getModelCountOfBrand($id) {
		$query = "  SELECT COUNT({$this->projektai_lentele}.`id`) AS `kiekis`
					FROM {$this->kurejai_lentele}
						INNER JOIN {$this->projektai_lentele}
							ON {$this->kurejai_lentele}.`id`={$this->projektai_lentele}.`fk_kurejas`
					WHERE {$this->kurejai_lentele}.`id`='{$id}'";
		$data = mysql::select($query);
		
		return $data[0]['kiekis'];
	}

	
}