<?php
	namespace OpenFixture\Mappers;

	use OpenFixture\Entities\BetEntity;
	use OpenFixture\Exceptions\NotImplementedException;
	use \InvalidArgumentException;

	class BetMapper extends Mapper
	{
		public function list()
		{

			//todo implements list() method

		}

		public function add($entity)
		{
			// TODO: Implement add() method.
		}

		public function delete($id)
		{
			// TODO: Implement delete() method.
		}

		/**
		 * @param  $id
		 * @return array
		 * @throws NotImplementedException
		 */
		public function view($id)
		{
			if(strtoupper($id)=='DAILY'){
				$query = 'SELECT DISTINCT G.game_id FROM V_DAILY_BETS G ORDER BY G.game_id ASC';
				$conn = $this->db->query($query);
				$game_id = null;
				$games_id=null;
				while ($game_id = $conn->fetch()) {
					$games_id[] = $game_id;
				}
				$game_id=null;
				$bets=null;

				foreach ($games_id as $k => $v){
					$query ='SELECT * FROM V_DAILY_BETS BETS WHERE BETS.game_id=:BETS';
					$stm=$this->db->prepare($query);
					$stm->execute([':BETS' => $v['game_id']]);
					$bets=null;
					while ($bet=$stm->fetch()) {
						$bets[]=$bet;
					}
					$matches[] = (array) new BetEntity($bets);
				}
				return $matches;
			}elseif(is_numeric($id)){
				throw new NotImplementedException();
			}
			else throw new InvalidArgumentException();



		}

		public function update($id)
		{
			// TODO: Implement update() method.
		}
	}
