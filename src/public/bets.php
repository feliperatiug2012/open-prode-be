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
	
	//update && save user bet to db
	$app->post('/save', function (Request $request, Response $response) use ($app) {
		$data = $request->getParsedBody();
		$bets_data = [];
		$bets_data['name'] = filter_var($data['username'], FILTER_SANITIZE_STRING);
		$bets_data['game_id'] = $data['game_id'];
		$bets_data['bet_goals_team_a'] = $data['bet_goals_team_a'];
		$bets_data['bet_goals_team_b'] = $data['bet_goals_team_b'];

		$mapper = new BetMapper($app->getConn());
		//$jsonResponse = $response->withJson($bets_data);
		$jsonResponse = $response->withJson($mapper->save($bets_data));
		return $jsonResponse;
	});

	$app->get('/view[/{params:.*}]', function (Request $request, Response $response, $args) use ($app)  {
		$params = explode('/',$request->getAttribute('params'));
		$mapper=new  BetMapper($app->getConn());
		$dailyBets = $mapper->view($params);
		$jsonResponse = $response->withJson($dailyBets);
		return $jsonResponse;

	});
// Run app
//todo: MANAGE EXCEPTIONS
	$app->run();