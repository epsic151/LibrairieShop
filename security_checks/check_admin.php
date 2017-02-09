<?php
	////////////////////////////////// ---------- Entête du programme ---------- //////////////////////////////////
	#################################################################
	#
	#	Programme:		check_admin.php
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
	#	Check rights for admin 
	#
	#################################################################
	//Check if session is opened
	if ($_SESSION['right'] != 1){
		header('Location: ../error/401.html');
		die;
	}
?>