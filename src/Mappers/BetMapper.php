<?php
	namespace OpenFixture\Mappers;

	use OpenFixture\Entities\BetEntity;
	use OpenFixture\Exceptions\NotImplementedException;
	use \InvalidArgumentException;
	use OpenFixture\Exceptions\DataBaseInsertException;
	use OpenFixture\Exceptions\DataBaseUpdateException;

	class BetMapper extends Mapper
	{
		/*
		 * @return array|void
		 * @throws NotImplementedException
		 */
		public function list()
		{

			throw new NotImplementedException();

		}

		/**
		 * @param $entity
		 * @return bool|int
		 */
		public function save($entity)
		{
			$betEntity=new BetEntity($entity,$this->db);
			try {
				return $betEntity->save();
			}catch (DataBaseInsertException $e){
					return false;
				}
			catch (DataBaseUpdateException $e){
				return false;
			}
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
		public function view($filter, $id=NULL)
		{
			$bets=null;
			switch (strtoupper($filter))
			{
				case 'DAILY': {
					$bets= $this->_listDailyBets(); break;
				}
				case 'HISTORY':{
					$bets = $this->_listHistoryBets($id); break;
				}
				case (is_numeric($filter) or filter_var($filter, FILTER_VALIDATE_EMAIL)): {
					$bets=$this->_listUserBets($filter); break;
				}
				default:
					throw new InvalidArgumentException("El URL del Request es inválido");
			}
		return $bets;
		}

		/**
		 * Función para obtener todas las apuestas de un usuario
		 * @param id
		 * @return array | null
		 *
		 */
		private function _listUserBets($id): array
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
									->select(function($phase) use ($bets){
										return [
											"phase_id"=>$phase["phase_id"],
											"phase_name"=>$phase["phase"],
											"games" =>  from($bets)
												->where(function($game) use ($phase){
													return $game["phase_id"]==$phase["phase_id"];
												})
												->select(function($game) use ($bets){
													return [
														"game_id"=>$game["game_id"],
														"bets_open"=>intval($game["bets_open"]),
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
		private function _listDailyBets() : array {

			$bets=null;
			$query = 'SELECT DISTINCT * FROM V_DAILY_BETS G ORDER BY G.game_id ASC';
			$conn = $this->db->query($query);
			$bets = $conn->fetchAll();
			$bets=from($bets)->select(function($games) use($bets){return[
				"date"          =>  null,
				"game_id"       =>  $games["game_id"],
				"date_up"          =>  $games["date_up"],
				"stadium"       =>  $games["stadium"],
				"game_status"   =>  $games["game_status"],
				"team_1"    =>  [
					"team_flag" =>  $games['flag_team_a'],
					"name"      =>  $games['name_team_a'],
					'goals'     =>  $games['goals_team_a']],
				"team_2"    =>  [
					"team_flag" =>  $games['flag_team_b'],
					"name"      =>  $games['name_team_b'],
					"goals"     =>  $games['goals_team_b']],
				"bets"          => from($bets)
					->where(function($usersBet) use ($games) {return $usersBet["game_id"]==$games["game_id"];})
					->select(function($usersBet) use ($games){return[
					"user_picture"  =>  $usersBet["picture_url"],
					"user_name"     =>  $usersBet["name"],
					"username"      =>  $usersBet["username"],
					"goals_team_1"  =>  $usersBet["bet_goals_team_a"],
					"goals_team_2"  =>  $usersBet["bet_goals_team_b"],
					"game_id"       =>  $usersBet["game_id"],
				];})
					->toList()
			];})->distinct('$v["game_id"]')
				->toList();
		//exit();
		return $bets;
		}

		/**
		 * Función para obtener las apuestas de un usuario hasta el día actual
		 * @param $id int
		 * @return array | null
		 */
		private function _listHistoryBets($id): array
		{
			if(is_numeric($id)){
				$query =    'SELECT *
							FROM V_USER_BETS G 
							WHERE G.user_id = :id
							AND G.date <= sysdate()
							ORDER BY G.game_id ASC';
			}else{
				$query =    'SELECT *
							FROM V_USER_BETS G 
							WHERE G.username = :id
							AND G.date <= sysdate()
							ORDER BY G.game_id ASC';
			}
			$matches=null;
			$stmt = $this->db->prepare($query);
			$stmt->execute([":id"=>$id]);
			$bets = $stmt->fetchAll();

			$mapped_bets = from($bets)
				->select(function($user) use ($bets) {
					return [
					"username"  =>  $user["username"],
					"user_id"   =>  $user["user_id"],
					"bets"    =>  from($bets)
						->select(function($game,$k) use ($bets){
							return ["game_id"=>$game["game_id"],
									"date"=>$game["date"],
									"stadium"=>$game["stadium"],
									"user_bets"=> [
										"team_a"        =>  $game['bet_goals_team_a'],
										"team_b"        =>  $game['bet_goals_team_b'],
										"bet_points"    =>  $game['bet_points']
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
					];})->toList();
			return $mapped_bets[0];
		}
	}
