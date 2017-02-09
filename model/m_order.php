<?php
	////////////////////////////////// ---------- Entête du programme ---------- //////////////////////////////////
	#################################################################
	#
	#	Programme:	m_order.php
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
	#	Order object.
	#
	#################################################################
if (!defined('INCLUDE_CHECK')) {
    http_response_code(404); die;
}

class Order {
    protected $_id;
    protected $_order_date;
    protected $_user;
    protected $_bookqnt;
    protected $_status;
    protected $_total_price;
    protected $_deleted;

    //Construction
    public function __construct(array $data) {
            $this -> hydrate($data);
    }

    //Hydrate
    public function hydrate($data) {
        foreach ($data as $key => $value) {
            //method = function name with given attr.
            $method = 'set' . $key;
            //if set exists: call the set function
            if (method_exists($this, $method)) {
                    $this -> $method($value);
            }
        }
    }
    
    public function getid() {
        return $this -> _id;
    }
    public function getorder_date() {
        return $this -> _order_date;
    }
    public function getuser() {
        return $this -> _user;
    }
    public function getstatus() {
        return $this -> _status;
    }
    public function gettotal_price() {
        return $this -> _total_price;
    }
    public function getdeleted() {
        return $this -> _deleted;
    }
    public function getbookqnt() {
        return $this->_bookqnt;
    }
    public function setbookqnt($bookqnt) {
        $this->_bookqnt = $bookqnt;
    }
    public function setid($id) {
        $this -> _id = $id;
    }
    public function setorder_date($order_date) {
        $this -> _order_date = date("Y-m-d H:i:s");
    }
    public function setuser($user) {
        $this -> _user = $user;
    }
    public function setstatus($status) {
        $this -> _status = $status;
    }
    public function settotal_price($total_price) {
        $this -> _total_price = $total_price;
    }
    public function setdeleted($deleted) {
        $this -> _deleted = $deleted;
    }
}
?>