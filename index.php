<title>Hello World</title>

<?php

require __DIR__.'/vendor/autoload.php';

use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

echo "Hello World!";
echo "\n\n";
echo $_ENV['CURRENT_COMMIT_HASH'];
