<?php

	use OpenFixture\Mappers\UserMapper;
	use \Psr\Http\Message\ServerRequestInterface as Request;
//	use \Psr\Http\Message\ResponseInterface as Response;
	use \Slim\Http\Response as Response;
	use OpenFixture\Entities\SuperAppEntity;
	require '../vendor/autoload.php';
	require '../autoload_open_fixture.php';

	$app = new SuperAppEntity();

//update && save users to db from social networks
$app->post('/save', function (Request $request, Response $response) use ($app) {
    $data = $request->getParsedBody();
    $user_data = [];
    $user_data['name'] = filter_var($data['name'], FILTER_SANITIZE_STRING);
    $user_data['alias'] = filter_var($data['alias'], FILTER_SANITIZE_STRING);
    $user_data['username'] = filter_var($data['username'], FILTER_SANITIZE_STRING);
    $user_data['picture'] = filter_var($data['picture'], FILTER_SANITIZE_STRING);

    $mapper = new UserMapper($app->getConn());
	$response = $response->withJson($mapper->save($user_data));
    return $response;
});
	/**
	 * @param $id = score-board ==> Tabla de posiciones | Otro valor ==> ViewEndPointInvalidOptionException
	 */
$app->get('/view/{id}', function (Request $request, Response $response, $args) use ($app)  {
	$id=$args['id'];

	if(is_numeric($id))
		$id=(int)$id;
	else
		$id = filter_var($args['id'], FILTER_SANITIZE_STRING);

	$mapper = new UserMapper($app->getConn());
    $jsonResponse = $response->withJson($mapper->view($id));
    return $jsonResponse;
});
$app->run();