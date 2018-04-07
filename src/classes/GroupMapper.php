<?php

class GroupMapper extends Mapper
{
    /**
     * Function to obtain all the groups
     * @return $groups with teams and the statistics of matches
     */
    public function getGroups()
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
            /*echo "<pre>";
                var_dump($group);
            echo "</pre>";*/
        }
        //exit();
        return $results;
    }

    /**
     * Function a group by id
     * @return $groups with teams and the statistics of matches
     */
    public function getGroupById($group_id)
    {
        $group = ["name"=>"","teams"=>[]];
        $arrayAux = [];
        // Query to obtain all the Groups
        $sql = "SELECT t.id, t.title, t.short_name, g.title as group_name
            from teams t
            join groups g on t.group_id = g.id
            where g.id = :g_id";
        $stmt = $this->db->prepare($sql);

        $res = $stmt->execute(["g_id" => $group_id]);
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
            /*echo "<pre>";
                var_dump($group);
            echo "</pre>";*/

        //exit();
        return $group;
    }
}