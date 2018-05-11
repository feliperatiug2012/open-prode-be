<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/8/18
	 * Time: 7:58 PM
	 */
	namespace OpenFixture\Entities{

		use OpenFixture\Entities\Calendar\Team;
		use OpenFixture\Entities\Calendar\CalendarMatch;

		class CalendarEntity {
			/**
			 * @var  CalendarMatch[]
			 */
			public $phase ;
			/**
			 * @var Team[]
			 */
			public $matches;

			public function __construct(array $matches)
			{

				$this->phase = $matches[0]['phase'];
				foreach ($matches as $k => $v) {
					//$this->phase=$v['Phase'];
					$team1 = new Team ($v['flag_team_a'], $v['name_team_a'], $v['goals_team_a']);
					$team2 = new Team($v['flag_team_b'], $v['name_team_b'], $v['goals_team_b']);
					$stadium = $v['stadium'];

					$cm = new CalendarMatch($v['game_id'], $v['date'], $team1, $team2, $stadium);
					$this->matches[] = $cm;

				}
			}


		}
	}
	// this is like having inner classes inside Calendar Entity
	namespace OpenFixture\Entities\Calendar {
		class CalendarMatch
		{
			public $date;
			public $team_1;
			public $team_2;
			public $stadium;
			public $game_id;


			public function __construct($game_id,$date, $team_1, $team_2, $stadium)
			{
				$this->game_id = $game_id;
				$this->date = $date;
				$this->team_1 = $team_1;
				$this->team_2 = $team_2;
				$this->stadium = $stadium;
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