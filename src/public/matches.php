<?php
    require '../vendor/autoload.php';
    require '../autoload_open_fixture.php';

    use OpenFixture\Entities\SuperAppEntity;
    use OpenFixture\Mappers\MatchMapper;
    use \Psr\Http\Message\ServerRequestInterface as Request;
    //	use \Psr\Http\Message\ResponseInterface as Response;
    use \Slim\Http\Response as Response;

	$app = new SuperAppEntity();

	//update && save users to db from social networks
	$app->post('/save', function (Request $request, Response $response) use ($app) {
	    $data = $request->getParsedBody();
	    $match_data = [];
	    $match_data['id'] = $data['id'];
	    $match_data['goals_team_a'] = $data['goals_team_a'];
	    $match_data['goals_team_b'] = $data['goals_team_b'];

	    $mapper = new MatchMapper($app->getConn());
	    $jsonResponse = $response->withJson($mapper->save($match_data));
	    return $jsonResponse;
	});

	$app->run();