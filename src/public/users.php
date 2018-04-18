<?php

<<<<<<< HEAD
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../enviromentsManager.php';

$app = new SuperAppEntity();

/*************************************************************
 * GET all users
 *************************************************************/
$app->get('/list', function (Request $request, Response $response) use ($app) {
    $mapper = new UserMapper($app->getConn());
    $users = $mapper->list();
    $jsonResponse = $response->withJson($users);
    return $jsonResponse;
});
/*************************************************************/

/*************************************************************
 * GET user by id
 *************************************************************/
$app->get('/{id}', function (Request $request, Response $response, $args) use ($app) {
    $user_id = (int)$args['id'];
    $mapper = new UserMapper($app->getConn());
    $user = $mapper->view($user_id);

    $jsonResponse = $response->withJson($user);
    return $jsonResponse;
})->setName('user-detail');
/*************************************************************/

/*************************************************************
 * POST a new user
 *************************************************************/
$app->post('/new', function (Request $request, Response $response) use ($app) {
    $data = $request->getParsedBody();
    $user_data = [];
    $user_data['title'] = filter_var($data['title'], FILTER_SANITIZE_STRING);
    $user_data['alias'] = filter_var($data['alias'], FILTER_SANITIZE_STRING);
    $user_data['username'] = filter_var($data['username'], FILTER_SANITIZE_STRING);
    $user_data['password'] = filter_var($data['password'], FILTER_SANITIZE_STRING);

    $user = new UserEntity($user_data);
    $user_mapper = new UserMapper($app->getConn());
    $user_mapper->add($user);

    $response = $response->withRedirect("/users.php/list");
    return $response;
});
/*************************************************************/



// Run app
$app->run();
=======
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

$app->post('/add', function (Request $request, Response $response) use ($app) {
    $data = $request->getParsedBody();
    $user_data = [];
    $user_data['name'] = filter_var($data['name'], FILTER_SANITIZE_STRING);
    $user_data['alias'] = filter_var($data['alias'], FILTER_SANITIZE_STRING);
    $user_data['username'] = filter_var($data['username'], FILTER_SANITIZE_STRING);
    $user_data['picture_url'] = filter_var($data['picture_url'], FILTER_SANITIZE_STRING);

//    $user = new UserListEntity($user_data);
    $mapper = new UserMapper($app->getConn());
	$response = $response->withJson($mapper->add($user_data));
    return $response;
});

$app->get('/user/{id}', function (Request $request, Response $response, $args) use ($app)  {
    $user_id = (int)$args['id'];
    $mapper = new UserMapper($app->getConn());
    $user = $mapper->getUserById($user_id);
    $jsonResponse = $response->withJson($user);
    return $jsonResponse;
})->setName('user-detail');



$app->run();
>>>>>>> 8fc221e8106d773a717aa72e3c87fd7aac7a7fc2
