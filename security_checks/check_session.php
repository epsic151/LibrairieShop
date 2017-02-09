<?php
	////////////////////////////////// ---------- Entête du programme ---------- //////////////////////////////////
	#################################################################
	#
	#	Programme:		check_session.php
	#	Auteur:		David Miranda
	#
	#################################################################
	#
	# 	Date :		janvier 2017
	#	Version :		1.0
	#	Révisions :		1.1 - David Miranda
	#
	#################################################################
	#
	#	Check session variable
	#
	#################################################################
	//Start the session 
	session_start();

	//Check if session is opened
	if (!isset($_SESSION['id'])){
		header('Location: ../error/401.html');
		die;
	}
?>