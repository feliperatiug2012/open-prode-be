<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../settings.php';

//TODO: make function getConn
 
//FIXME: must insert db-conn as an array from getConn function
$config =   [ 
            'settings' => [
                'addContentLengthHeader'    => false,
                'displayErrorDetails'       => true,
                'db'=>[
                    'host'=>'127.0.0.1',
                    'user' => 'batman',
                    'pass' => 'batman',
                    'dbname' => 'open_fixture'
                ]
            ]
            ];

$app = new SuperAppEntity($config);
// Define app routes
$app->get('/list', function ($request, $response, $args) use ($app)  {
        $query='SELECT * FROM V_GAMES_CALENDAR';
        $result = $app->getConn()->query($query);
        while ($user = $result->fetch()) {
            var_dump($user);
        }

        return $response->write("games.api=> list 22");
});
// Run app
$app->run();




?>