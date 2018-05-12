<?php

require '../vendor/autoload.php';
require '../autoload_open_fixture.php';
use OpenFixture\Entities\SuperAppEntity;
	use OpenFixture\Mappers\ConfigurationMapper;
	use OpenFixture\Mappers\GroupMapper;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new SuperAppEntity();

	$app->get(/**
	 * @param Request $request
	 * @param Response $response
	 * @param $args
	 * @return mixed
	 */
		'/view/{filter}', function (Request $request, Response $response, $args) use ($app)  {
		$filter = $args['filter'];

		$mapper=new  ConfigurationMapper($app->getConn());
		$dailyBets = $mapper->view($filter);
		$jsonResponse = $response->withJson($dailyBets);
		return $jsonResponse;

	});

// Run app
//todo: MANAGE EXCEPTIONS
$app->run();
?>