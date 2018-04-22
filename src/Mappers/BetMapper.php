<?php
	namespace OpenFixture\Mappers;
	use OpenFixture\Entities\Bet\BetListEntity;
	use OpenFixture\Exceptions\NotImplementedException;
	use \InvalidArgumentException;

	class BetMapper extends Mapper
	{
		/**
		 * @return array|void
		 * @throws NotImplementedException
		 */
		public function list()
		{

			throw new NotImplementedException();

		}

		/**
		 * @param $entity
		 * @return bool|int|void
		 * @throws NotImplementedException
		 */
		public function save($entity)
		{
			throw new NotImplementedException();
		}

		/**
		 * @param int $id
		 * @return bool|void
		 */
		public function delete( $id )
		{
			// TODO: Implement delete() method.
		}

		/**
		 * @param  $id
		 * @return array | null
		 * @throws NotImplementedException
		 */
		public function view($id)
		{
			$bets=null;
			if(strtoupper($id)=='DAILY'){
				$bets= $this->_listDailyBets();
			}elseif(is_numeric($id) or filter_var($id, FILTER_VALIDATE_EMAIL)){
				$bets=$this->_listUserBets($id);
			}
			else throw new InvalidArgumentException();
		return $bets;
		}


		private function _listUserBets($id)
		{
			if(is_numeric($id))
				$query =    'SELECT *
							FROM V_USER_BETS G 
							WHERE G.user_id=:id
							ORDER BY G.game_id ASC';
			else
				$query =    'SELECT *
							FROM V_USER_BETS G 
							WHERE G.username=:id
							ORDER BY G.game_id ASC';
			$matches=null;
			$stmt = $this->db->prepare($query);
			$stmt->execute([":id"=>$id]);
			$bets = $stmt->fetchAll();

			$mapped_bets = from($bets)
				->where(function ($user) use($id){return
				$user['username']==$id or $user['user_id']==$id;
				})
				->distinct(function($user){
					return $user['username'];
				})
				->select(function($user) use ($bets) {
					return [
					"username"  =>  $user["username"],
					"user_id"   =>  $user["user_id"],
					"phases"    =>  from($bets)
									->select(function($phase,$k) use ($bets){
										return [
											"phase_id"=>$phase["phase_id"],
											"phase_name"=>$phase["phase"],
											"games" =>  from($bets)
												->where(function($game) use ($phase){
													return $game["phase_id"]==$phase["phase_id"];
												})
												->select(function($game,$k) use ($bets){
													return [
														"game_id"=>$game["game_id"],
														"date"=>$game["date"],
														"stadium"=>$game["stadium"],
														"user_bets"=> [
															"team_a"=>$game['bet_goals_team_a'],
															"team_b"=>$game['bet_goals_team_b']
														],
														"team_a"=>  [
															"id"     => $game['team_id_a'],
															"name"   => $game['name_team_a'],
															"flag"   => $game['flag_team_a'],
															"goals"  => $game['goals_team_a'],
														],
														"team_b"=>  [
															"id"     => $game['team_id_b'],
															"name"   => $game['name_team_b'],
															"flag"   => $game['flag_team_b'],
															"goals"  => $game['goals_team_b'],
														],
													];})->toList()
										];})
									->distinct('$v["phase_id"]')->toList()
				];})
				->toList();
			return $mapped_bets[0];
		}
		/**
		 * @return array
		 */
		private function _listDailyBets() : array
		{
			$matches=null;
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
				$matches[] = (array) new BetListEntity($bets);
			}
			return $matches;
		}


	}
