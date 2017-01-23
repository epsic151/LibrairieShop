<?php
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
                    <td>$book[1]</td>
                    <td>$book[11]</td>
                    <td>$book[2]</td>
                    <td>$book[6]</td>
                    <td>$book[5] $book[4]</td>
                    <td>CHF $price</td>
                    <td>$book[9]</td>
                    <td>$book[10] unités en stock</td>
                    <td>
                        <button class=\"btn\" onclick=\"add(".$book[0].")\"><i class=\"fa fa-shopping-cart\"></i></button>
                        <a href=\"modif_book.php?book=".$book[0]."\"><button class=\"admin-menu btn\"><i class=\"fa fa-edit\"></i></button></a>
                    </td>
                </tr>\n\r";

                //Layout for clients
                $HTMLlayout .= "<tr>
                    <td><img src=\"$book[8]\" style=\"max-width: 180px;\" /></td>
                    <td>$book[1]</td>
                    <td>$book[11]</td>
                    <td>$book[2]</td>
                    <td>$book[6]</td>
                    <td>$book[5] $book[4]</td>
                    <td>CHF $price</td>
                    <td>$book[9]</td>
                    <td>$book[10] unités en stock</td>
                    <td>
                        <button class=\"btn\" onclick=\"add(".$book[0].")\"><i class=\"fa fa-shopping-cart\"></i></button>
                    </td>
                </tr>\n\r";
            }
        } else
            echo 'Une erreur est survenue avec la base de données!';

    //.end Processing
    
    //Open the session
    //require_once ($_SERVER['DOCUMENT_ROOT'] . "/../_hroot/session.php");
    
    //Check if session is opened
    //require_once ($_SERVER['DOCUMENT_ROOT'] . "/../_hroot/check_session.php");

    //HTML dynamic meta data
    $__title = 'Livres';
    
    //  Request for cart products
    session_start();
    
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