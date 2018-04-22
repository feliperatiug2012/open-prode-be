<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/15/18
	 * Time: 2:37 PM
	 */

	require '../vendor/autoload.php';
	require '../autoload_open_fixture.php';

	use OpenFixture\Entities\SuperAppEntity;
	use OpenFixture\Mappers\BetMapper;
	use \Psr\Http\Message\ServerRequestInterface as Request;
	//	use \Psr\Http\Message\ResponseInterface as Response;
	use \Slim\Http\Response as Response;

	$app = new SuperAppEntity();
	$app->get('/view/{id}', function (Request $request, Response $response, $args) use ($app)  {
		$id = $args['id'];
		$mapper=new  BetMapper($app->getConn());
		$dailyBets = $mapper->view($id);
		$jsonResponse = $response->withJson($dailyBets);
		return $jsonResponse;

	});
// Run app
//todo: MANAGE EXCEPTIONS
	$app->run();