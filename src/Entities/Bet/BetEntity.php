<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/8/18
	 * Time: 7:58 PM
	 */
	namespace OpenFixture\Entities\Bet {
		use OpenFixture\Entities\Entity;
		use OpenFixture\Exceptions\NotImplementedException;


		//use OpenFixture\Entities\Bet\BetEntity;
		//todo: implementar aca el guardado de apuestas, ver como lo hace USERS
		class BetEntity extends Entity
		{
			/**
			 * BetEntity constructor.
			 * @param array $data
			 * @param \PDO $db
			 * @throws NotImplementedException
			 */
			public function __construct(array $data, $db)
			{

				parent::__construct($data,$db);
				throw new NotImplementedException();
			}

			/**
			 * @throws NotImplementedException
			 */
			public function getId()
			{
				// TODO: Implement getId() method.
				throw new NotImplementedException();
			}

			/**
			 * @throws NotImplementedException
			 */
			protected function update()
			{
				// TODO: Implement update() method.
				throw new NotImplementedException();
			}

			/**
			 * @throws NotImplementedException
			 */
			protected function add()
			{
				// TODO: Implement add() method.
				throw new NotImplementedException();
			}
		}

	}
