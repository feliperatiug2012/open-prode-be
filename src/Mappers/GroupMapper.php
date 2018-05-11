<?php
	namespace OpenFixture\Mappers;

use OpenFixture\Entities\TeamEntity;
use OpenFixture\Exceptions\NotImplementedException;

class GroupMapper extends Mapper
{
    	/**
	 * Debe listar todos los elementos de la clase
	 * @return mixed
	 */
	public function list()
	{
		$results = [];

		$sql = "SELECT distinct * FROM V_POSICION_EQUIPO";
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