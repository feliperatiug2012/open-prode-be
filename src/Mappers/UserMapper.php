<?php
namespace OpenFixture\Mappers;

use OpenFixture\Entities\User\UserEntity;
//use OpenFixture\Entities\User\UserListEntity;
use OpenFixture\Exceptions\DataBaseInsertException;
use OpenFixture\Exceptions\DataBaseUpdateException;
use OpenFixture\Exceptions\ViewEndPointInvalidOptionException;
use OpenFixture\Mappers\Mapper;

class UserMapper extends Mapper
{
    public function list()
    {
	    // TODO: Implement list() method.
    }

	/**
	 * Get one ticket by its ID
	 *
	 * @param int $id The ID of the user
	 * @return UserEntity  The user
	 * @throws ViewEndPointInvalidOptionException
	 */
    public function view($id,$param=NULL)
    {
       	if ($id=='score-board') {
		    $sql = "SELECT * FROM V_SCORE_BOARD";
		    $stmt = $this->db->query($sql);
		    $v_score_board = $stmt->fetchAll();
		    $scoreBoard = from($v_score_board)
			    ->select(function ($users) use ($v_score_board) {
				    return [
					    "name"          => $users["name"],
					    "alias"         => $users["alias"],
					    "username"      => $users["username"],
					    "picture_url"   => $users["picture_url"],
					    "total_points"  => $users["total_points"],
					    "rank"  => $users["rank"]
				    ];
			    })
			    ->orderBy('$v["rank"]')
			    ->toList();
	    }else{
    		throw new ViewEndPointInvalidOptionException();
	    }
	    return $scoreBoard;
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