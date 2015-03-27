<?php

use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;

require __DIR__.'/vendor/autoload.php';

$socks = array();

class Server implements MessageComponentInterface {
    public function __construct() { }

    public function onOpen(ConnectionInterface $sock) {
        global $socks;

        $socks[] = $sock;
    }

    public function onMessage(ConnectionInterface $sock_from, $msg) {
        global $socks;

        foreach ($socks as $sock) {
            $sock->send($msg);
        }
    }

    public function onClose(ConnectionInterface $sock) { }
    public function onError(ConnectionInterface $sock, \Exception $e) { }
}

$app = new Ratchet\App('157.7.137.100', 5000, '0.0.0.0');
$app->route('/', new Server, ['*']);
$app->run();
