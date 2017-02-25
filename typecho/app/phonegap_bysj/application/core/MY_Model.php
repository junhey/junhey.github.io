<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );

/**
 * 数据库CRUD操作扩展(models)
 * Model.php
 * ============================================================
 * 简化数据库CRUD基本功能操作
 * ============================================================
 */
class MY_Model extends CI_Model {
	protected $table; // 当前操作的data table
	/**
	 * 构造函数
	 * $table:数据表
	 */
	function __construct($table = '', $database = 'default') {
		parent::__construct ();
		$this->db = $this->load->database ( $database, TRUE );
		$this->table = $table;
	}
	
	/**
	 * 添加数据
	 * $dataArr:(array)插入的数据
	 * return:当前插入的数据id
	 */
	function insert($dataArr) {
		$this->db->insert ( $this->table, $dataArr );
		return $this->db->insert_id ();
	}
	
	/**
	 * 修改数据
	 * $dataArr:(array)更新的数据
	 * $whereArr:(array)更新的条件
	 * return:更新的数据条数
	 */
	function update($dataArr, $whereArr) {
		$this->db->where ( $whereArr );
		$this->db->update ( $this->table, $dataArr );
		return $this->db->affected_rows ();
	}
	
	/**
	 * 删除数据
	 * $whereArr:(array)删除的条件
	 * return:删除的数据条数
	 */
	function delete($whereArr) {
		$this->db->where ( $whereArr );
		$this->db->delete ( $this->table );
		return $this->db->affected_rows ();
	}
	
	/**
	 * 查询并返回一条数据
	 * $whereArr:(array)查询的条件
	 * $type:返回结果类型，默认为obj格式，arr为数组格式
	 * return:查询结果
	 */
	function row($whereArr, $type = 'obj') {
		$this->db->where ( $whereArr );
		$query = $this->db->get ( $this->table );
		if ($type == 'obj') return $query->row ();
		elseif ($type == 'arr') return $query->row_array ();
	}
	
	/**
	 * 查询并返回多条数据
	 * $whereArr:(array)查询的条件
	 * $type:返回结果类型，默认为obj格式，arr为数组格式
	 * $num:单页显示的条数
	 * $page:当前页数
	 * $orderby:排序条件
	 * return:查询结果
	 */
	function result($whereArr, $type = 'obj', $num = 10, $page = 1, $orderby = "") {
		if ($page == 0) $page = 1;
		$offset = ($page - 1) * $num;
		$this->db->where ( $whereArr );
		if (! empty ( $orderby )) {
			$orderby = str_replace ( "@", " ", $orderby );
			$this->db->order_by ( $orderby );
		}
		$query = $this->db->get ( $this->table, $num, $offset );
		if ($type == 'obj') return $query->result ();
		elseif ($type == 'arr') return $query->result_array ();
	}
	
	/**
	 * 查询数据条数
	 * $whereArr:(array)查询的条件
	 * return:查询结果数据条数
	 */
	function num_rows($whereArr) {
		$this->db->where ( $whereArr );
		$query = $this->db->get ( $this->table );
		return $query->num_rows ();
	}
}