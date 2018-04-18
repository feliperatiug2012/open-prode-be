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
<<<<<<< HEAD
            $results [] = $row;
            /*echo "<pre>";
                var_dump($row);
            echo "</pre>";*/
        }
        //exit();
        return $results;
=======
	        $scoreBoard[] = (array)new UserListEntity($row);
        }
	    return $scoreBoard;
>>>>>>> 8fc221e8106d773a717aa72e3c87fd7aac7a7fc2
    }

    /**
     * Get one ticket by its ID
     *
     * @param int $$id The ID of the user
     * @return UserEntity  The user
     */
<<<<<<< HEAD
    public function view($user_id)
=======
    public function view($id)
>>>>>>> 8fc221e8106d773a717aa72e3c87fd7aac7a7fc2
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

<<<<<<< HEAD
    public function delete($id)
    {
        // TODO: Implement delete() method.
        $sql = "update users
                set deleted = 1
                where id = :user_id";
        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute(["user_id" => $id]);

        if ($result) {
            //return new UserEntity($stmt->fetch());
            return $stmt->fetch();
        }
    }

    public function add($user)
=======
    public function add($user_array)
>>>>>>> 8fc221e8106d773a717aa72e3c87fd7aac7a7fc2
    {
       //$userEntity=new UserAddEntity($user_array,$this->db);
       try {
	     //  $userEntity->save();
	        return true;
       }catch (DataBaseInsertException $e){
			return false;
        }
    }

<<<<<<< HEAD
    public function update($id)
    {
        // TODO: Implement update() method.
    }

=======
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
>>>>>>> 8fc221e8106d773a717aa72e3c87fd7aac7a7fc2
}