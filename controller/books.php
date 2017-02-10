<?php
	////////////////////////////////// ---------- Entête du programme ---------- //////////////////////////////////
	#################################################################
	#
	#	Programme:	books.php
	#	Auteur:		David Miranda & Rapahël Dufour & Miguel Jalube & Patrick Hervieux
	#
	#################################################################
	#
	# 	Date :		Decembre 2016
	#	Version :		1.0
	#	Révisions :		1.1 - David Miranda 
	#
	#################################################################
	#
	#	Start page of the site, construct views select all books in database and add them to the table view. 
	#
	#################################################################
    session_start();
    //Security for views and models
    define('INCLUDE_CHECK', true);
    
    //Processing
        //Models requirements
        require_once ($_SERVER['DOCUMENT_ROOT'] . '/model/m_book_manager.php');

        $BookManager = new BookManager();

        //Select all products from DB
        $books = $BookManager -> select();
        $HTMLlayout = null;
        $HTMLlayout_admin = null;
        if (is_array($books)) {
            foreach ($books as $book) {
                //Price processing add .- if cents are null
                if (strpos($book[7], '.') !== FALSE)
                    $price = $book[7];
                else 
                    $price = $book[7].'.-';
              
                //Layout for admin
                $HTMLlayout_admin .= "<tr>
                    <td><img src=\"../images/books/$book[8]\" style=\"max-width: 180px;\" /></td>
                    <td>".htmlentities($book[1])."</td>
                    <td>".htmlentities($book[11])."</td>
                    <td>".htmlentities($book[2])."</td>
                    <td>".htmlentities($book[6])."</td>
                    <td>".htmlentities($book[5])." ".htmlentities($book[4])."</td>
                    <td>CHF ".htmlentities($price)."</td>
                    <td>".htmlentities($book[9])."</td>
                    <td>".htmlentities($book[10])." unités en stock</td>
                    <td>
                        <button class=\"btn\" onclick=\"add(".$book[0].")\"><i class=\"fa fa-shopping-cart\"></i></button>
                        <a href=\"modif_book.php?book=".$book[0]."\"><button class=\"admin-menu btn\"><i class=\"fa fa-edit\"></i></button></a>
                        <a href=\"view_book.php?book=".$book[0]."\"><button class=\"user-menu btn\"><i class=\"fa fa-eye\"></i></button></a>
                    </td>
                </tr>\n\r";

                //Layout for clients
                $HTMLlayout .= "<tr>
                    <td><img src=\"../images/books/$book[8]\" style=\"max-width: 180px;\" /></td>
                    <td>".htmlentities($book[1])."</td>
                    <td>".htmlentities($book[11])."</td>
                    <td>".htmlentities($book[2])."</td>
                    <td>".htmlentities($book[6])."</td>
                    <td>".htmlentities($book[5])." ".htmlentities($book[4])."</td>
                    <td>CHF ".htmlentities($price)."</td>
                    <td>".htmlentities($book[9])."</td>
                    <td>".htmlentities($book[10])." unités en stock</td>
                    <td>
                        <button class=\"btn\" onclick=\"add(".$book[0].")\"><i class=\"fa fa-shopping-cart\"></i></button>
                        <a href=\"view_book.php?book=".$book[0]."\"><button class=\"user-menu btn\"><i class=\"fa fa-eye\"></i></button></a>
                    </td>
                </tr>\n\r";
            }
        } else
            echo 'Une erreur est survenue avec la base de données!';

    //.end Processing

    //HTML dynamic meta data
    $__title = 'Livres';

    
    //  transforme $_SESSION['cart'] en tableau s'il existe
    if(isset($_SESSION['cart'])){
        $cart = unserialize($_SESSION['cart']);
    }
    
    //  Selectionne les données du panier dans la base de données
    if(isset($cart[0])){
        $cartBookList = $BookManager->select_items($cart);
    }
    
    //View construction
    require_once ($_SERVER['DOCUMENT_ROOT'] . '/view/templates/head.php');
    require_once ($_SERVER['DOCUMENT_ROOT'] . '/view/templates/nav.php');
    require_once ($_SERVER['DOCUMENT_ROOT'] . '/view/v_books.php');
    require_once ($_SERVER['DOCUMENT_ROOT'] . '/view/templates/scripts.php');
?>