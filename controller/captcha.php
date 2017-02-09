<?php
	////////////////////////////////// ---------- Entête du programme ---------- //////////////////////////////////
	#################################################################
	#
	#	Programme:	captcha.php
	#	Auteur:		Miguel Jalube
	#
	#################################################################
	#
	# 	Date :		janvier 2017
	#	Version :		1.0
	#	Révisions :		1.1 - David Miranda
	#
	#################################################################
	#
	#	Function captcha: use 3 images and display randomly one of them.
	#
	#################################################################

    function captcha($post){
        $captchaimg = array(
            '1'=>'83tsU',
            '2'=>'viearer',
            '3'=>'ZZECEL'
        );
        if(!isset($post['submit'])){
            $captcharnd = rand(1, 3);
            $_SESSION['captcha'] = $captchaimg[$captcharnd];
        }
        return $captchaimg;
    }