<?php
	/**
	 * Cambios para agregarlos a stage
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/8/18
	 * Time: 7:58 PM
	 */
	namespace OpenFixture\Entities {

		use OpenFixture\Entities\Bet\Team;
		use OpenFixture\Entities\Bet\Bet;
		use OpenFixture\Entities\Entity;

		class BetEntity extends Entity 
		{
			public $user_id;
			public $username;
			public $game_id;
			public $goals_team_a;
			public $goals_team_b;

			public function __construct(array $data, $db )
			{
				parent::__construct($data,$db); 
				//$this->$user_id = $data['user_id'];
				$this->user_id = 0;
				$this->username = $data['name'];
				$this->game_id = $data['game_id'];
				$this->goals_team_a = $data['bet_goals_team_a'];
				$this->goals_team_b = $data['bet_goals_team_b'];
			}
			
			public function getId(){
				
				// if the instance have an id
				if(isset($this->id))
					return $this->id;

				// Gets the user's id witch make the bet
				try {
					$sql1 = "SELECT id from users where username=:username";
					$stm1=$this->db->prepare($sql1);
					if(!$stm1->execute([":username"=>$this->username]))
						return false;
					$stm1=$stm1->fetch();
					$this->user_id = $stm1['id'];
				}
				catch(PDOException $e)
				{
					echo $sql1 . "<br>" . $e->getMessage();
				}
				
				//echo("BetEntity= ");
				//var_dump($this->username);
				
				// gets the id of the game of the bet
				try {
					$sql2 = "SELECT id from bets where user_id=:user_id and game_id=:game_id";
					$stm2=$this->db->prepare($sql2);
					if(!$stm2->execute([":user_id"=>$this->user_id,":game_id"=>$this->game_id]))
						return false;

					$stm2=$stm2->fetch();
				}
				catch(PDOException $e)
				{
					echo $sql2 . "<br>" . $e->getMessage();
				}

				if (isset($stm2['id'])){
					$this->id=$stm2['id'];
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
					$sql = "UPDATE bets
					SET goals_team_a = :goals_a, 
						goals_team_b = :goals_b
					WHERE id = :id";
						
					$stm=$this->db->prepare($sql);
					$result=$stm->execute([
						":goals_a"=>$this->goals_team_a, 
						":goals_b"=>$this->goals_team_b,
						":id"=>$this->id]);
						
					if (!$result)
						throw new DataBaseInsertException("no se pudo agregar la apuesta, username o juego inexistente");
				}
				catch(PDOException $e)
				{
					echo $sql . "<br>" . $e->getMessage();
				}
				return $this->id;
			}
			
			/**
			 * @throws DataBaseInsertException
			 */
			protected function add(){
				try {
					$sql = "INSERT INTO bets (user_id, game_id, goals_team_a, goals_team_b)
					 		VALUES (:user, :game, :goals_a, :goals_b)";
					$stm=$this->db->prepare($sql);
					$result=$stm->execute([
						":user"=>$this->user_id, 
						":game"=>$this->game_id, 
						":goals_a"=>$this->goals_team_a, 
						":goals_b"=>$this->goals_team_b]);
					if (!$result)
						throw new DataBaseInsertException("no se pudo agregar la apuesta, username o juego inexistente");
				}
				catch(PDOException $e)
				{
					echo $sql . "<br>" . $e->getMessage();
				}
				return $this->getId();
			}
		}
	}

	// this is like having inner classes inside Bet Entity
	namespace OpenFixture\Entities\Bet {
		class Bet
		{
			public $time;
			/**
			 * @var \OpenFixture\Entities\Bet\Team
			 */
			public $team_1;
			/**
			 * @var \OpenFixture\Entities\Bet\Team
			 */
			public $team_2;
			/**
			 * @var \OpenFixture\Entities\Bet\Bet[]
			 */
			public $bets;
			public $stadium;
			public $game_status;

			public function __construct(array $game)
			{
				$this->time=$game[0]["time"];
				$this->stadium=$game[0]["stadium"];
				$this->game_status=$game[0]["game_status"];
				$this->team_1=new Team($game[0]["flag_team_a"], $game[0]["name_team_a"], $game[0]["goals_team_a"]);
				$this->team_2=new Team($game[0]["flag_team_b"], $game[0]["name_team_b"], $game[0]["goals_team_b"]);
				foreach ($game as $k => $bet) {
					$this->bets[]=new BetEntity($bet);
				}
			}
		}
			
			
		class Team
		{
			public $team_flag;
			public $name;
			public $goals;

			public function __construct($teamFlag, $name, $goals)
			{
				$this->goals = $goals;
				$this->name = $name;
				$this->team_flag = $teamFlag;
			}

		}
	}

