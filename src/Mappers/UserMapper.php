<?php
namespace OpenFixture\Mappers;
use OpenFixture\Entities\User\UserAddEntity;
use OpenFixture\Entities\User\UserListEntity;
use OpenFixture\Entities\UserEntity;
use OpenFixture\Exceptions\DataBaseInsertException;
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
	        $scoreBoard[] = (array)new UserListEntity($row);
        }
	    return $scoreBoard;
    }

    /**
     * Get one ticket by its ID
     *
     * @param int $$id The ID of the user
     * @return UserEntity  The user
     */
    public function view($id)
    {
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

    public function add($user_array)
    {
       //$userEntity=new UserAddEntity($user_array,$this->db);
       try {
	     //  $userEntity->save();
	        return true;
       }catch (DataBaseInsertException $e){
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