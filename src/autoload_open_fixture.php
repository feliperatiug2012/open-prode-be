<?php

	class AutoLoad
	{
		const UNABLE_TO_LOAD = 'Unable to load class';
		//protected static $dirs = array();
		protected static $dirs = array();
		protected static $registered = 0;

		public function __construct(array $dirs = array())
		{
			self::init($dirs);
		}

		public static function addDirs($dirs)
		{
			if (is_array($dirs)) {
				self::$dirs = array_merge(self::$dirs, $dirs);
			} else {
				self::$dirs[] = $dirs;
			}
		}

		public static function init($dirs = array())
		{
			if ($dirs) {
				self::addDirs($dirs);
			}
			if (self::$registered == 0) {
				spl_autoload_register(__CLASS__ . '::autoload');
				self::$registered++;
			}
		}

		public static function autoload($class) : bool
		{
			$success = FALSE;

			$fileName = str_replace('\\', DIRECTORY_SEPARATOR, $class) . '.php';
			$fileName=str_replace("OpenFixture".DIRECTORY_SEPARATOR,"",$fileName);
			foreach (self::$dirs as $start) {
				$file = $start . DIRECTORY_SEPARATOR . $fileName;
				if (self::loadFile($file)) {
					$success = TRUE;
					break;
				}
			}

			if (!$success) {
				if (!self::loadFile(str_replace("OpenFixture".DIRECTORY_SEPARATOR,"",__DIR__ . DIRECTORY_SEPARATOR . $fileName))) {
					throw new \Exception(self::UNABLE_TO_LOAD . ' ' . $class);
				}
			}
			return $success;
		}

		protected static function loadFile($file) : bool
		{
			if (file_exists($file)) {
				require_once $file;
				return TRUE;
			}
			return FALSE;
		}
	}

	require 'enviromentsManager.php';
	AutoLoad::init();