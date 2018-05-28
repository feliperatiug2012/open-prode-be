<?php
	namespace OpenFixture\Mappers;
	use OpenFixture\Exceptions\NotImplementedException;

	class TeamMapper extends Mapper
	{
		/**
		 * Debe listar todos los elementos de la clase
		 * @return mixed
		 */
		public function list()
		{
			$sql = "SELECT * FROM V_TEAMS";
			$stmt = $this->db->query($sql);
			$v_teams = $stmt->fetchAll();

			$groups_table = from($v_teams)
				->select(function ($team) use ($v_teams) {
					return [
						"team_id"       =>  $team['team_id'],
						"team_name"     =>  $team['team_name'],
						"short_name"    =>  $team['short_name'],
						"team_flag"     =>  $team['team_flag'],
						"group_id"      =>  $team['group_id'],
						"group_name"    =>  $team['group_name']
					];
				})->toList();
			return $groups_table;
		}

		/**
		 * Funcion que debe listar el detalle de un individuo de la clase dado su Id unico
		 * @param $filter String | null
		 * @param $id integer | null
		 * @return void
		 * @throws NotImplementedException
		 */
		public function view($filter, $id=null)
		{
			throw new NotImplementedException('metodo no implementado');
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
		 * funcion que recibe un objeto de la clase y la agrega a la BD, el valor que devuelve
		 * es el id unico generado al insertar el registro
		 * @param $entity
		 * @return integer
		 */
		public function save($entity)
		{
			// TODO: Implement add() method.
		}




	}