<?php
/**
 * Automobilių redagavimo klasė
 *
 * @author ISK
 */

class games {

	private $markes_lentele = '';
	private $modeliai_lentele = '';
	private $automobiliai_lentele = '';
	private $auto_busenos_lentele = '';
	private $sutartys_lentele = '';
	private $degalu_tipai_lentele = '';
	private $kebulu_tipai_lentele = '';
	private $pavaru_dezes_lentele = '';
	private $lagaminai_lentele = '';
	
	public function __construct() {
		$this->markes_lentele = config::DB_PREFIX . 'kurejai';
		$this->modeliai_lentele = config::DB_PREFIX . 'projektai';
		$this->automobiliai_lentele = config::DB_PREFIX . 'zaidimai';
		$this->auto_busenos_lentele = config::DB_PREFIX . 'zaidimu_stadijos';
		$this->sutartys_lentele = config::DB_PREFIX . 'uzsakymai';
		$this->degalu_tipai_lentele = config::DB_PREFIX . 'kontroleriai';
		$this->kebulu_tipai_lentele = config::DB_PREFIX . 'os';		
		$this->pavaru_dezes_lentele = config::DB_PREFIX . 'zanrai';
		$this->lagaminai_lentele = config::DB_PREFIX . 'rekomenduojami_amziai';
	}
	
	/**
	 * zaidimo išrinkimas
	 * @param type $id
	 * @return type
	 */
	public function getCar($id) {
		$query = "  SELECT `{$this->automobiliai_lentele}`.`id`,
						   `{$this->automobiliai_lentele}`.`isleidimo_data`,
						   `{$this->automobiliai_lentele}`.`multiplayer`,
						   `{$this->automobiliai_lentele}`.`coop`,
						   `{$this->automobiliai_lentele}`.`zaideju_skaicius`,
						   `{$this->automobiliai_lentele}`.`verte`,
						   `{$this->automobiliai_lentele}`.`zanras`,
						   `{$this->automobiliai_lentele}`.`kontroleris`,
						   `{$this->automobiliai_lentele}`.`os`,
						   `{$this->automobiliai_lentele}`.`rekomenduojamas_amzius`,
						   `{$this->automobiliai_lentele}`.`stadija`,
						   `{$this->automobiliai_lentele}`.`fk_projektas` AS `projektas`
					FROM `{$this->automobiliai_lentele}`
					WHERE `{$this->automobiliai_lentele}`.`id`='{$id}'";
		$data = mysql::select($query);
		
		return $data[0];
	}
	
	/**
	 * zaidimo atnaujinimas
	 * @param type $data
	 */
	public function updateCar($data) {
		$query = "  UPDATE `{$this->automobiliai_lentele}`
					SET    `isleidimo_data`='{$data['isleidimo_data']}',
						   `multiplayer`='{$data['multiplayer']}',
						   `coop`='{$data['coop']}',
						   `zaideju_skaicius`='{$data['zaideju_skaicius']}',
						   `verte`='{$data['verte']}',
						   `zanras`='{$data['zanras']}',
						   `kontroleris`='{$data['kontroleris']}',
						   `os`='{$data['os']}',
						   `rekomenduojamas_amzius`='{$data['rekomenduojamas_amzius']}',
						   `stadija`='{$data['stadija']}',
						   `fk_projektas`='{$data['projektas']}'
					WHERE `id`='{$data['id']}'";
		mysql::query($query);
	}

	/**
	 * zaidimo įrašymas
	 * @param type $data
	 */
	public function insertCar($data) {
		$query = "  INSERT INTO `{$this->automobiliai_lentele}` 
								(
									`isleidimo_data`,
									`multiplayer`,
									`coop`,
									`zaideju_skaicius`,
									`verte`,
									`zanras`,
									`kontroleris`,
									`os`,
									`rekomenduojamas_amzius`,
									`stadija`,
									`fk_projektas`
								) 
								VALUES
								(
									'{$data['isleidimo_data']}',
									'{$data['multiplayer']}',
                                                                        '{$data['coop']}',
                                                                        '{$data['zaideju_skaicius']}',
									'{$data['verte']}',
									'{$data['zanras']}',
									'{$data['kontroleris']}',
									'{$data['os']}',
									'{$data['rekomenduojamas_amzius']}',
									'{$data['stadija']}',
									'{$data['projektas']}'
								)";
		mysql::query($query);
	}
	
	/**
	 * zaidimu sąrašo išrinkimas
	 * @param type $limit
	 * @param type $offset
	 * @return type
	 */
	public function getCarList($limit = null, $offset = null) {
		$limitOffsetString = "";
		if(isset($limit)) {
			$limitOffsetString .= " LIMIT {$limit}";
		}
		if(isset($offset)) {
			$limitOffsetString .= " OFFSET {$offset}";
		}
		
		$query = "  SELECT `{$this->automobiliai_lentele}`.`id`,
						   `{$this->automobiliai_lentele}`.`isleidimo_data`,
						   `{$this->auto_busenos_lentele}`.`name` AS `stadija`,
						   `{$this->modeliai_lentele}`.`pavadinimas` AS `projektas`,
						   `{$this->markes_lentele}`.`pavadinimas` AS `kurejas`
					FROM `{$this->automobiliai_lentele}`
						LEFT JOIN `{$this->modeliai_lentele}`
							ON `{$this->automobiliai_lentele}`.`fk_projektas`=`{$this->modeliai_lentele}`.`id`
						LEFT JOIN `{$this->markes_lentele}`
							ON `{$this->modeliai_lentele}`.`fk_kurejas`=`{$this->markes_lentele}`.`id`
						LEFT JOIN `{$this->auto_busenos_lentele}`
							ON `{$this->automobiliai_lentele}`.`stadija`=`{$this->auto_busenos_lentele}`.`id`" . $limitOffsetString;
		$data = mysql::select($query);
		
		return $data;
	}

	/**
	 * zaidimu kiekio radimas
	 * @return type
	 */
	public function getCarListCount() {
		$query = "  SELECT COUNT(`{$this->automobiliai_lentele}`.`id`) AS `kiekis`
					FROM `{$this->automobiliai_lentele}`
						LEFT JOIN `{$this->modeliai_lentele}`
							ON `{$this->automobiliai_lentele}`.`fk_projektas`=`{$this->modeliai_lentele}`.`id`
						LEFT JOIN `{$this->markes_lentele}` 
							ON `{$this->modeliai_lentele}`.`fk_kurejas`=`{$this->markes_lentele}`.`id`
						LEFT JOIN `{$this->auto_busenos_lentele}`
							ON `{$this->automobiliai_lentele}`.`stadija`=`{$this->auto_busenos_lentele}`.`id`";
		$data = mysql::select($query);
		
		return $data[0]['kiekis'];
	}
	
	/**
	 * zaidimo šalinimas
	 * @param type $id
	 */
	public function deleteCar($id) {
		$query = "  DELETE FROM `{$this->automobiliai_lentele}`
					WHERE `id`='{$id}'";
		mysql::query($query);
	}
	
	/**
	 * uzsakymu, į kuriuos įtrauktas zaidimas, kiekio radimas
	 * @param type $id
	 * @return type
	 */
	public function getContractCountOfCar($id) {
		$query = "  SELECT COUNT(`{$this->sutartys_lentele}`.`nr`) AS `kiekis`
					FROM `{$this->automobiliai_lentele}`
						INNER JOIN `{$this->sutartys_lentele}`
							ON `{$this->automobiliai_lentele}`.`id`=`{$this->sutartys_lentele}`.`fk_zaidimas`
					WHERE `{$this->automobiliai_lentele}`.`id`='{$id}'";
		$data = mysql::select($query);
		
		return $data[0]['kiekis'];
	}
	
	/**
	 * zanru sąrašo išrinkimas
	 * @return type
	 */
	public function getGearboxList() {
		$query = "  SELECT *
					FROM `{$this->pavaru_dezes_lentele}`";
		$data = mysql::select($query);
		
		return $data;
	}
	
	/**
	 * kontroleriu sąrašo išrinkimas
	 * @return type
	 */
	public function getFuelTypeList() {
		$query = "  SELECT *
					FROM `{$this->degalu_tipai_lentele}`";
		$data = mysql::select($query);
		
		return $data;
	}

	/**
	 * os sąrašo išrinkimas
	 * @return type
	 */
	public function getBodyTypeList() {
		$query = "  SELECT *
					FROM `{$this->kebulu_tipai_lentele}`";
		$data = mysql::select($query);
		
		return $data;
	}

	/**
	 * rekomenduojamu_amziu  sąrašo išrinkimas
	 * @return type
	 */
	public function getLugageTypeList() {
		$query = "  SELECT *
					FROM `{$this->lagaminai_lentele}`";
		$data = mysql::select($query);
		
		return $data;
	}

	/**
	 * stadiju sąrašo išrinkimas
	 * @return type
	 */
	public function getCarStateList() {
		$query = "  SELECT *
					FROM `{$this->auto_busenos_lentele}`";
		$data = mysql::select($query);
		
		return $data;
	}
	
}