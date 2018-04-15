<?php

class UserMapper extends Mapper
{
    public function list()
    {
        $sql = "SELECT t.id, t.title, t.alias, t.username, t.password, t.approved, t.deleted
            from users t
            where t.deleted = 0";
        $stmt = $this->db->query($sql);

        $results = [];
        while ($row = $stmt->fetch()) {
            $results [] = $row;
            /*echo "<pre>";
                var_dump($row);
            echo "</pre>";*/
        }
        //exit();
        return $results;
    }

    /**
     * Get one ticket by its ID
     *
     * @param int $user_id The ID of the user
     * @return UserEntity  The user
     */
    public function view($user_id)
    {
        $sql = "SELECT t.id, t.title, t.alias, t.username, t.password, t.approved, t.created, t.modified, t.deleted
            from users t
            where t.id = :user_id";
        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute(["user_id" => $user_id]);

        if ($result) {
            //return new UserEntity($stmt->fetch());
            return $stmt->fetch();
        }

    }

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
    {
        $sql = "insert into users
            (title, alias, username, password, created, modified) values
            (:title, :alias, :username, :password, now(), now())";

        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute([
            "title" => $user->getTitle(),
            "alias" => $user->getAlias(),
            "username" => $user->getUsername(),
            "password" => $user->getPassword(),
        ]);

        if (!$result) {
            throw new Exception("could not save record");
        }
    }

    public function update($id)
    {
        // TODO: Implement update() method.
    }

}