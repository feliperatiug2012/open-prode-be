<?php
	namespace OpenFixture\Mappers;
	use OpenFixture\Interfaces\Imapper;

	abstract class Mapper implements Imapper
	{
		/**
		 * @var \PDO
		 */
		protected $db;

		/**
		 * Mapper constructor.
		 * @param \PDO $db
		 */
		public function __construct($db)
		{
			$this->db = $db;
		}

	}
