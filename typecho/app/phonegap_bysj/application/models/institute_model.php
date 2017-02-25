<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );
class Institute_model extends MY_Model {
	/**
	 * 构造函数
	 */
	function __construct() {
		parent::__construct ( 'hj_u_m_institutes' );
	}
}