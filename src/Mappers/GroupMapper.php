<?php
	namespace OpenFixture\Mappers;

use OpenFixture\Entities\TeamEntity;

class GroupMapper extends Mapper
{
    	/**
	 * Debe listar todos los elementos de la clase
	 * @return mixed
	 */
	public function list()
	{
		$results = [];

		$sql = "SELECT * FROM V_POSICION_EQUIPO";
		$stmt = $this->db->query($sql);
		$groups_table = $stmt->fetchAll();
		
		
		$group = ["name"=>"","teams"=>[]];
		$arrayAux = [];
		// Query to obtain all the Groups
		$sql = "SELECT g.id, g.title
            from groups g";
		$stmt = $this->db->query($sql);
		while ($row = $stmt->fetch()) {

			if (isset($row['title'])) {
				$group ['name'] = $row['title'];
			}
			$g_id = $row['id'];

			$sql2 = "SELECT t.id, t.title, t.short_name
            from teams t
            where t.group_id = :group_id";

			$stmt2 = $this->db->prepare($sql2);
			$res = $stmt2->execute(["group_id" => $g_id]);
			if ($res)
			{
				// Query to obtain teams of a group
				$arrayAux = [];
				while ($rows = $stmt2->fetch()) {
					$team = new TeamEntity($rows);
					$arrayAux[] = $team->getStats();
				}
				$group['teams'] = $arrayAux;
			}
			$results[] = $group;
		}
		return $results;
	}

	/**
	 * Funcion que debe listar el detalle de un individuo de la clase dado su Id unico
	 * @param $filter String | null
	 * @param $id integer | null
	 * @return array
	 */
	public function view($filter, $id=null)
	{
		$results = [];

		$sql = "SELECT * FROM V_POSICION_EQUIPO";
		$stmt = $this->db->query($sql);
		$v_groups_table = $stmt->fetchAll();

		$groups_table = from($v_groups_table)
			->select(function ($group) use ($v_groups_table) {
				return [
					"name"          => "NOMBRE DEL GRUPO" //$GROUP['group_name']
					//"teams"         => from ()
				];
			})
			->toList();
		return $groups_table;
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