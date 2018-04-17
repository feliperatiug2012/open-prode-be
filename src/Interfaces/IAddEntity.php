<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/17/18
	 * Time: 1:55 AM
	 */

	namespace OpenFixture\Interfaces;


	use OpenFixture\Exceptions\DataBaseInsertException;

	Interface IAddEntity
	{
		/**
		 * UserAddEntity constructor.
		 * @param array $data
		 * @param \PDO $db
		 */
		public function __construct(array $data, $db);
		/**
		 * @throws DataBaseInsertException
		 */
		public function save();
	}