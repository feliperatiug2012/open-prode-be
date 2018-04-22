<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/10/18
	 * Time: 1:08 AM
	 */
	namespace OpenFixture\Middlewares;
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
			return $response->withHeader('Access-Control-Allow-Origin', get_var_enviroment('CORS_URL')/*'http://localhost:4200'*/)
							->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
							->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
		}
	}