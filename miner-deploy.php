<?php

if(isset($_GET['deploy']))
	{
	//echo "hi";
	$os = $_GET['os'];
	$hostname = $_GET['hostname'];
  $port = $_GET['port'];
  $username = $_GET['username'];
  $password = $_GET['password'];
  $minergateemail = $_GET['minergateemail'];
  $currency = $_GET['currency'];
	
	$command = ("./miner-deploy.sh '".$os."' '".$hostname."' '".$port."' '".$username."' '".$password."' '".$minergateemail."' '".$currency."'");
	//echo $command;
	$output = exec($command);
  echo "<pre>$output</pre>";

	exit;
	}

?>