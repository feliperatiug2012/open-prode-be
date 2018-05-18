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
					"name"          => $group['group_title'],
					"group_id"      => $group['group_id'],
					"teams"         => from ($v_groups_table)
						->select(function ($team) use ($v_groups_table) {
							return [
								"flag_url"  =>  $team['team_flag'],
								"name"      =>  $team['title_team'],
								"pg"        =>  $team['pg'],
								"pe"        =>  $team['pe'],
								"pp"        =>  $team['pp'],
								"gf"        =>  $team['gf'],
								"gc"        =>  $team['gc'],
								"dg"        =>  $team['dg'],
								"dg"        =>  $team['dg'],
								"pj"        =>  $team['pj'],
								"pts"       =>  $team['pts'],
								"team_id"   =>  $team['team_id'],
								"group_id"   =>  $team['group_id']
							];
						})->where(function($team) use ($group){
							return $team["group_id"]==$group["group_id"];
						})->toList()
				];
			})->distinct('$v["group_id"]')->toList();
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