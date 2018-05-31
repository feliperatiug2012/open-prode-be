<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 5/12/18
	 * Time: 12:45 PM
	 */

	namespace OpenFixture\Mappers;

	class ConfigurationMapper extends Mapper
	{

		/**
		 * Debe listar todos los elementos de la clase
		 * @return array
		 */
		public function list()
		{
			// TODO: Implement list() method.
		}

		/**
		 * Funcion que debe listar el detalle de un individuo de la clase dado su Id unico
		 * @param $filter String | null
		 * @param $id integer | null
		 * @return array
		 */
		public function view($filter, $id = NULL)
		{
			$filter = strtoupper($filter);

			if($filter == 'NOW'){

				$now=getdate();
				$date=$now['year'].'-' //year
					.substr('00'.$now['mon'],-2).'-' //month 2 digits
					.substr('00'.$now['mday'],-2).' '//day 2 digits
					.substr('00'.$now['hours'],-2).':'//hours 2 digits
					.substr('00'.$now['minutes'],-2).':'//minutes 2 digits
					.substr('00'.$now['seconds'],-2);//seconds 2 digits

				return $date;
			}



			if($filter == 'PRIZE-CURRENCY')
				$sql = "SELECT  COUNT(*) * (SELECT C.value FROM configurations C WHERE C.short_name='CONT-PER-USER') value,
	                            (SELECT C.value FROM configurations C WHERE C.short_name='PRIZE-CURRENCY') currency
						FROM V_SCORE_BOARD WHERE approved=1";

//			$stmt = $this->db->prepare($sql);
//			$stmt->execute([":filter" => $filter]);
			$stmt = $this->db->query($sql);
			$configurations = $stmt->fetchAll();
			$prize_amount = from($configurations)->select(function($conf){
				return ["value"     =>  $conf['value'],
						"currency"  =>  $conf['currency']];
			})->toList();
		return $prize_amount[0];
		}

		/**
		 * Funcion que debe leliminar un individuo de la clase dado su Id unico
		 * @param $id integer
		 * @return boolean
		 */
		public function delete($id)
		{
			// TODO: Implement delete() method.
		}

		/**
		 * funcion que recibe un objeto de la clase y la agrega o la actualiza en la BD segun sea el caso, el valor que devuelve
		 * es el id unico generado al insertar el registro
		 * @param $entity
		 * @return integer | boolean
		 */
		public function save($entity)
		{
			// TODO: Implement save() method.
		}
	}