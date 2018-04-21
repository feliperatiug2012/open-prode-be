<?php

	use OpenFixture\Entities\User\UserListEntity;
	use OpenFixture\Mappers\UserMapper;
	use \Psr\Http\Message\ServerRequestInterface as Request;
	use \Psr\Http\Message\ResponseInterface as Response;
	use OpenFixture\Entities\SuperAppEntity;
	require '../vendor/autoload.php';
	require '../autoload_open_fixture.php';

	$app = new SuperAppEntity();

	$app->get('/list', function (Request $request, Response $response) use ($app)  {
	    $mapper = new UserMapper($app->getConn());
	    $users = $mapper->list();
	    $jsonResponse = $response->withJson($users);
	    return $jsonResponse;
	});

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

$app->get('/view/{id}', function (Request $request, Response $response, $args) use ($app)  {
    //todo: check if this function works
	$user_id = (int)$args['id'];
    $mapper = new UserMapper($app->getConn());
    $user = $mapper->getUserById($user_id);
    $jsonResponse = $response->withJson($user);
    return $jsonResponse;
})->setName('user-detail');

$app->run();