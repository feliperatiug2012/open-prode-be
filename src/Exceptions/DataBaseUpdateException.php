<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/18/18
	 * Time: 10:05 PM
	 */

	namespace OpenFixture\Exceptions;
	use Exception;

	class DataBaseUpdateException extends Exception
	{

		/**
		 * DataBaseUpdateException constructor.
		 * @param string $string
		 */
		public function __construct($string)
		{
			$this->message=$msg;
		}
	}