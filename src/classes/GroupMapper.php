<?php

class GroupMapper extends Mapper
{
    	/**
	 * Debe listar todos los elementos de la clase
	 * @return mixed
	 */
	public function list()
	{
		$results = [];
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
	 * @param $id integer
	 * @return array
	 */
	public function view($id)
	{
		$group = ["name"=>"","teams"=>[]];
		$arrayAux = [];
		// Query to obtain all the Groups
		$sql = "SELECT t.id, t.title, t.short_name, g.title as group_name
            from teams t
            join groups g on t.group_id = g.id
            where g.id = :g_id";
		$stmt = $this->db->prepare($sql);

		$res = $stmt->execute(["g_id" => $id]);
		if ($res)
		{
			// Query to obtain teams of a group
			$arrayAux = [];
			$row = $stmt->fetch();
			$group['name'] = $row['group_name'];

			do {
				$team = new TeamEntity($row);
				$arrayAux[] = $team->getStats();
			}while ($row = $stmt->fetch());

			$group['teams'] = $arrayAux;
		}

		return $group;
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
	public function add($entity)
	{
		// TODO: Implement add() method.
	}

	/**
	 * Funcion que debe actualizar un individuo de la clase dado su Id unico, devuelve true
	 * en caso de exito y false en caso de error
	 * @param $id integer
	 * @return boolean
	 */
	public function update($id)
	{
		// TODO: Implement update() method.
	}



}