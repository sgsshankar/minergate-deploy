<?php


if (isset($_GET['deploy']))
	{
	$os = $_GET['os'];
	$hostname = $_GET['hostname'];
  $port = $_GET['port'];
  $username = $_GET['username'];
  $password = $_GET['password'];
  $minergateemail = $_GET['minergateemail'];
  $currency = $_GET['currency'];

	$output = shell_exec("./miner-deploy.sh '".$os."' '".$hostname."' '".$port."' '".$username."' '".$password."' '".$minergateemail."' '".$currency."'");
  echo "<pre>$output</pre>";
	exit;
	}

?>