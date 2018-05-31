<?php

	use OpenFixture\Mappers\UserMapper;
	use \Psr\Http\Message\ServerRequestInterface as Request;
//	use \Psr\Http\Message\ResponseInterface as Response;
	use \Slim\Http\Response as Response;
	use OpenFixture\Entities\SuperAppEntity;
	require '../vendor/autoload.php';
	require '../autoload_open_fixture.php';

//	$app = new SuperAppEntity(['ignore' => '/']);
	$app = new SuperAppEntity(['ignore' => '/view/score-board']);

//update && save users to db from social networks
$app->post('/save', function (Request $request, Response $response) use ($app) {
    $data = $request->getParsedBody();
    $user_data = [];

    if(isset($data['name']))
        $user_data['title']             = filter_var($data['name'],     FILTER_SANITIZE_STRING);
	if(isset($data['alias']))
	    $user_data['alias']             = filter_var($data['alias'],    FILTER_SANITIZE_STRING);
	if(isset($data['username']))
	    $user_data['username']          = filter_var($data['username'], FILTER_SANITIZE_EMAIL);
	if(isset($data['picture_url']))
	    $user_data['picture_url']       = filter_var($data['picture_url'],  FILTER_SANITIZE_STRING);
	if(isset($data['team_fav_id']))
		$user_data['team_fav_id']       = filter_var($data['team_fav_id'],  FILTER_SANITIZE_NUMBER_INT);
	if(isset($data['approved']))
	    $user_data['approved']          = filter_var($data['approved'], FILTER_SANITIZE_NUMBER_INT);
	if(isset($data['approver_id']))
	    $user_data['approver_id']       = filter_var($data['approver_id'], FILTER_SANITIZE_NUMBER_INT);
	if(isset($data['date_approved']))
	    $user_data['date_approved']     = filter_var($data['date_approved'], FILTER_SANITIZE_STRING);

    $mapper = new UserMapper($app->getConn());
	$response = $response->withJson($mapper->save($user_data));
    return $response;
});
	/**
	 * @param $id = score-board ==> Tabla de posiciones | Otro valor ==> ViewEndPointInvalidOptionException
	 */
$app->get('/view/{id}', function (Request $request, Response $response, $args) use ($app)  {
	$id=$args['id'];
//	$id=$request->getAttribute('token')['email'];

	if(is_numeric($id))
		$id=(int)$id;
	else
		$id = filter_var($args['id'], FILTER_SANITIZE_STRING);

	$mapper = new UserMapper($app->getConn());
    $jsonResponse = $response->withJson($mapper->view($id));
    return $jsonResponse;
});
$app->run();