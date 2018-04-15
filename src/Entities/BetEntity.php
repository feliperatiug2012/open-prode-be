<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/8/18
	 * Time: 7:58 PM
	 */
	namespace OpenFixture\Entities {

		use OpenFixture\Entities\Bet\Team;
		use OpenFixture\Entities\Bet\Bet;

		class BetEntity {
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
					$this->bets[]=new Bet($bet["username"], $bet["bet_goals_team_a"], $bet["bet_goals_team_b"]);
				}
			}
		}
	}

	// this is like having inner classes inside Calendar Entity
	namespace OpenFixture\Entities\Bet {
		class Bet
		{
			public $user_name;
			public $goals_team_1;
			public $goals_team_2;

			public function __construct($userName, $goals_team_1, $goals_team_2)
			{
				$this->user_name = $userName;
				$this->goals_team_1 = $goals_team_1;
				$this->goals_team_2 = $goals_team_2;
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