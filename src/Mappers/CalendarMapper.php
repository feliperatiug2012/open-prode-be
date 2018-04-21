<?php
	namespace OpenFixture\Mappers;

	use OpenFixture\Entities\CalendarEntity;

	class CalendarMapper extends Mapper
	{
		public function list()
		{
			$query = 'SELECT DISTINCT phase_id FROM V_GAMES_CALENDAR ORDER BY phase_id ASC';
			$conn = $this->db->query($query);
			$phases_id = null;
			while ($phase_id = $conn->fetch()) {
				$phases_id[] = $phase_id;
			}
			$phases = null;
			foreach ($phases_id as $k => $v) {
				$query = 'SELECT * FROM V_GAMES_CALENDAR WHERE phase_id=:phase_id ORDER BY date asc';
				$stm = $this->db->prepare($query);
				$stm->execute(array(':phase_id' => $v['phase_id']));
				$phase = null;
				while ($match = $stm->fetch()) {
					$phase[] = $match;
				}
				//var_dump($phase);
				$phases[] = (array)new CalendarEntity($phase);
			}
			return $phases;

		}

		public function save($entity)
		{
			// TODO: Implement add() method.
		}

		public function delete($id)
		{
			// TODO: Implement delete() method.
		}

		public function view($id)
		{
			// TODO: Implement view() method.
		}

	}
