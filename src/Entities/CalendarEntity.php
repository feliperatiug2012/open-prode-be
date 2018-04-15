<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/8/18
	 * Time: 7:58 PM
	 */
	namespace OpenFixture\Entities;

	class CalendarMatch
	{
		public $date;
		public $team_1;
		public $team_2;
		public $stadium;

		public function __construct($date, $team_1, $team_2, $stadium)
		{
			$this->date = $date;
			$this->team_1 = $team_1;
			$this->team_2 = $team_2;
			$this->stadium = $stadium;
		}
	}

	class Team
	{
		public $teamFlag;
		public $name;
		public $goals;

		public function __construct($teamFlag, $name, $goals)
		{
			$this->goals = $goals;
			$this->name = $name;
			$this->teamFlag = $teamFlag;
		}

	}

	class CalendarEntity
	{
		public $phase;
		public $matchs;

		public function __construct(array $matchs)
		{

			$this->phase = $matchs[0]['phase'];
			foreach ($matchs as $k => $v) {
				//$this->phase=$v['Phase'];
				$team1 = new Team ($v['flag_team_a'], $v['name_team_a'], $v['goals_team_a']);
				$team2 = new Team($v['flag_team_b'], $v['name_team_b'], $v['goals_team_b']);
				$stadium = $v['stadium'];

				$cm = new CalendarMatch($v['date'], $team1, $team2, $stadium);

				$this->matchs[] = $cm;

			}
		}


	}
