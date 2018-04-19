<?php
namespace OpenFixture\Mappers;
use OpenFixture\Entities\User\UserEntity;
use OpenFixture\Entities\User\UserListEntity;
use OpenFixture\Exceptions\DataBaseInsertException;
use OpenFixture\Exceptions\DataBaseUpdateException;
use OpenFixture\Mappers\Mapper;
class UserMapper extends Mapper
{
    public function list()
    {
        $sql = "SELECT * FROM V_SCORE_BOARD";
        $stmt = $this->db->query($sql);
        $users = [];
        $scoreBoard=null;
        while ($row = $stmt->fetch()) {
	        $scoreBoard[] = (array)new UserListEntity($row,$this->db);
        }
	    return $scoreBoard;
    }

    /**
     * Get one ticket by its ID
     *
     * @param int $id The ID of the user
     * @return UserEntity  The user
     */
    public function view($id)
    {
    	//todo: check if this function works
        $sql = "SELECT t.id, t.title, t.alias, t.username, t.password, t.approved, t.created, t.modified, t.deleted
            from users t
            where t.id = :id";
        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute([":id" => $$id]);

        if ($result) {
            //return new UserEntity($stmt->fetch());
            return $stmt->fetch();
        }

    }

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