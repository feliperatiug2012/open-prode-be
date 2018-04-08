<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../enviromentsManager.php';


$app = new SuperAppEntity();


$app->get('/list', function ($request, $response, $args) use ($app)  {

		$query='SELECT * FROM V_GAMES_CALENDAR';
        $result = $app->getConn()->query($query);
        while ($user = $result->fetch()) {
            var_dump($user);
        }
        return $response->write("games.api=> list 5555");
});





// Run app
$app->run();




?>