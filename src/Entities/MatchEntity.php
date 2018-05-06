<?php
    namespace OpenFixture\Entities {

        use OpenFixture\Entities\Entity;

        class MatchEntity extends Entity
        {
            protected $goals_team_a;
            protected $goals_team_b;
            
            /**
             * GameEntity construtor
             * @param $data of the game
             */
            public function __construct($data,$db)
            {
                parent::__construct($data,$db); 
				$this->goals_team_a = $data['goals_team_a'];
                $this->goals_team_b = $data['goals_team_b'];
            }

            /**
             * Obtain a Match id
             * @return int
             * @trows NotImplementedException
             */
            public function getId()
            {
                // if the instance have an id
                if(isset($this->id))
                {
                    return $this->id;
                }
                    

                // Gets the id of the match
                try {
                    $sql1 = "SELECT id from games 
                            where id=:id";
                            
                    $stm1=$this->db->prepare($sql1);
                    if(!$stm1->execute([":id"=>$this->id]))
                        return "No hay registros";
                    $stm1=$stm1->fetch();
                }
                catch(PDOException $e)
                {
                    throw new NotImplementedException("Hubo un error en la ejecución en la sentencia: " .
                     $sql1 .
                     "<br>" .
                     $e->getMessage());
                }
                
                if (isset($stm1['id'])){
                    $this->id=$stm1['id'];
                    return $this->id;
                }
                else
                    return null;
                    
            }


            /**
			 * @throws DataBaseInsertException
			 */
			protected function update(){
                $stm=null;
                    
				if(!isset($this->id))
					throw new DataBaseUpdateException("no se puede hacer el update sin un ID");

				try {
                    
					$sql = "UPDATE games
					SET modified = sysdate(),
                        goals_team_a = :goals_a, 
						goals_team_b = :goals_b
					WHERE id = :id";
						
					$stm=$this->db->prepare($sql);
					$result=$stm->execute([
						":goals_a"=>$this->goals_team_a, 
						":goals_b"=>$this->goals_team_b,
						":id"=>$this->id]);
						
					if (!$result)
						throw new DataBaseInsertException("no se pudo actualizar el partido,juego inexistente");
				}
				catch(PDOException $e)
				{
                    throw new NotImplementedException("Hubo un error en la ejecución en la sentencia: " .
                    $sql .
                    "<br>" .
                    $e->getMessage());
				}
				return $this->id;
			}
            
            /**
			 * @throws DataBaseInsertException
			 */
            protected function add(){}
                

        }
    }