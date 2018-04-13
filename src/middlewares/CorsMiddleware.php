<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/10/18
	 * Time: 1:08 AM
	 */
	class CorsMiddleware
	{
		/**
		 * Example middleware invokable class
		 *
		 * @param  \Psr\Http\Message\ServerRequestInterface $request  PSR7 request
		 * @param  \Psr\Http\Message\ResponseInterface      $response PSR7 response
		 * @param  callable                                 $next     Next middleware
		 *
		 * @return \Psr\Http\Message\ResponseInterface
		 */
		public function __invoke($request, $response, $next)
		{
			$response = $next($request, $response);
			//todo: remove hardcoded URL http://localhost:4200 and check allowed methods and authorizations headers
			return $response->withHeader('Access-Control-Allow-Origin', 'http://localhost:4200')
							->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
							->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
		}
	}