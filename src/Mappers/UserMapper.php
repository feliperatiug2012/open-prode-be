<?php
namespace OpenFixture\Mappers;

use OpenFixture\Entities\UserEntity;
//use OpenFixture\Entities\User\UserListEntity;
use OpenFixture\Exceptions\DataBaseInsertException;
use OpenFixture\Exceptions\DataBaseUpdateException;
use OpenFixture\Exceptions\ViewEndPointInvalidOptionException;

class UserMapper extends Mapper
{
    public function list()
    {
	    // TODO: Implement list() method.
    }

	/**
	 * Get one ticket by its ID
	 *
	 * @param $filter String | null
	 * @param $id integer | null
	 * @return array
	 * @throws ViewEndPointInvalidOptionException
	 */
    public function view($filter, $id=NULL)
    {
    	function retrieveUserFromArray($data){
		    return from($data)
			    ->select(function ($users) use ($data) {
				    if(!isset($users["alias"]) || $users["alias"]==null)
					    $users["alias"]=$users["name"];
				    if($users["admin"]==1) $users["admin"] = true; else $users["admin"]=false;
				    if($users["approved"]==1) $users["approved"] = true; else $users["approved"]=false;
				    return [
					    "id"            => intval($users["user_id"]),
					    "name"          => $users["name"],
					    "alias"         => $users["alias"],
					    "username"      => $users["username"],
					    "picture_url"   => $users["picture_url"],
					    "team_fav_id"   => intval($users["team_fav_id"]),
					    "team_fav_name" => $users["team_fav_name"],
					    "team_fav_flag" => $users["team_fav_flag"],
					    "total_points"  => intval($users["total_points"]),
					    "rank"          => intval($users["rank"]),
					    "approved"      => $users["approved"],
					    "date_approved" => $users["date_approved"],
					    "approver_id"	=> intval($users["approver_id"]),
					    "event_start"	=> ($users["event_start"]),
					    "admin"	        => $users["admin"]
				    ];
			    });
//    		return $user;
	    }
       	if ($filter=='score-board') {
		    $sql = "SELECT * FROM V_SCORE_BOARD";
		    $stmt = $this->db->query($sql);
		    $v_score_board = $stmt->fetchAll();
	        $user=retrieveUserFromArray($v_score_board)
				    ->orderBy('$v["rank"]')
				    ->toList();
	    } elseif ($filter=='not-approved'){
	        $sql = "SELECT * FROM V_SCORE_BOARD S WHERE S.approved=0";
	        $stmt = $this->db->query($sql);
	        $v_score_board = $stmt->fetchAll();
	        $user=retrieveUserFromArray($v_score_board)->toList();

        } elseif(isset($filter) && (is_numeric($filter) || filter_var($filter, FILTER_VALIDATE_EMAIL))){

       		if(is_numeric($filter))
		        $sql = "SELECT * FROM V_SCORE_BOARD u where u.user_id=:filter";
	        else
		        $sql = "SELECT * FROM V_SCORE_BOARD u where u.username=:filter";

	        $stmt = $this->db->prepare($sql);
	        $stmt->execute([":filter" => $filter]);
	        $v_score_board = $stmt->fetchAll();
	        $user=retrieveUserFromArray($v_score_board)->toList()[0];
	    }else throw new ViewEndPointInvalidOptionException($filter.' no es un filtro valido');
	    return $user;
    }

	/**
	 * @param $user_array
	 * @return bool|int
	 */
    public function save($user_array)
    {
       $userEntity=new UserEntity($user_array,$this->db);
       try {
	       return $userEntity->save();
       }catch (DataBaseInsertException $e){
			return false;
        }
       catch (DataBaseUpdateException $e){
	       return false;
       }
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

}