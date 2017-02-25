<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );
class Webservices extends CI_Controller {
	private $resultJSON;
	private $result_code;
	private $result_msg;
	private $result_data = array ();
	private $callback;
	private $webserviceArr;
	public function __construct() {
		parent::__construct ();
		$this->db = $this->load->database ( "default", TRUE );
		$this->callback = $this->input->get ( "callback" );
		header ( "content-type:text/html;charset=utf-8" );
		$this->webserviceArr = array (
				"dataType" => "jsonp",
				"format" => 'callbackName({"msg":"msgData","code":"codeData","data":{"field":"value"}})',
				"desc" => "<div>callbackName：自定义的回调名；<br />
				msg：通信消息；<br />
				code：通信代码（2000表示获取数据成功，4001表示数据为空）；<br />
				data：通信数据内容（只有 code是2000的时候才有数据）</div>" 
		);
	}
	public function index() {
		$data = array (
				"dataType" => $this->webserviceArr ["dataType"],
				"format" => $this->webserviceArr ["format"],
				"desc" => $this->webserviceArr ["desc"],
				"webservice" => array (
						array (
								"serviceName" => "course_list",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "success表示成功，faild表示失败",
								"para" => array (
										array (
												"field" => "courseCategory",
												"desc" => "课程分类号（如果为空，则获取列表数据）" 
										) 
								) 
						),
						array (
								"serviceName" => "course_cont",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "success表示成功，faild表示失败",
								"para" => array (
										array (
												"field" => "courseNo",
												"desc" => "课程号（如果为空，则获取列表数据）" 
										) 
								) 
						),
						array (
								"serviceName" => "course",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "获取该学生的加入，预约，收藏的课程 success表示获取成功，faild表示获取失败",
								"para" => array (
										
								)
						),
						array (
								"serviceName" => "insert_course",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "加入，预约，收藏的课程 success表示获取成功，faild表示获取失败",
								"para" => array (
										array (
												"field" => "selStatus",
												"desc" => "选课状态（如果为空，则获取列表数据）"
										)
								)
						),
						array (
								"serviceName" => "search_course",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "搜索课程 success表示获取成功，faild表示获取失败",
								"para" => array (
										array (
												"field" => "keyword",
												"desc" => "关键词"
										)
								)
						),
						array (
								"serviceName" => "message_cont",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "success表示成功，faild表示失败",
								"para" => array (
										array (
												"field" => "studentNo",
												"desc" => "学号（学号不能为空）"
										)
								)
						),
						array (
								"serviceName" => "notice_cont",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "success表示成功，faild表示失败",
								"para" => array (
										array (
												"field" => "noticeNo",
												"desc" => "通知号（如果为空，则获取列表数据）" 
										) 
								) 
						),
						array (
								"serviceName" => "student_cont",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "success表示成功，faild表示失败",
								"para" => array (
										array (
												"field" => "studentNo",
												"desc" => "学号（如果为空，则获取学生列表数据）"
										)
								)
						),
						array (
								"serviceName" => "alter_student",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "save_result为success表示数据保存成功，faild表示学生修改失败",
								"para" => array (
										array (
												"field" => "studentNo",
												"desc" => "学号"
										),
										array (
												"field" => "studentName",
												"desc" => "学生姓名"
										),
										array (
												"field" => "idCard",
												"desc" => "身份证号"
										),
										array (
												"field" => "address",
												"desc" => "地址"
										),
										array (
												"field" => "password",
												"desc" => "密码"
										)
								)
						),
						array (
								"serviceName" => "teacher_cont",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "success表示成功，faild表示失败",
								"para" => array (
										array (
												"field" => "teacherNo",
												"desc" => "工号（如果为空，则获取列表数据）"
										)
								)
						),
						array (
								"serviceName" => "institute_cont",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "success表示成功，faild表示失败",
								"para" => array (
										array (
												"field" => "instituteNo",
												"desc" => "学院编号（如果为空，则获取列表数据）"
										)
								)
						),
						array (
								"serviceName" => "evaluate_cont",
								"method" => 'get',
								"format" => 'callbackName({"msg":"success","code":"2000","data":{"save_result":"success"}})',
								"result" => "success表示成功，faild表示失败",
								"para" => array (
										array (
												"field" => "evaluateNo",
												"desc" => "评论编号"
										)
								)
						)
						
				) 
		);		
		$this->load->view ( 'webservices', $data );
	}
	//定义数据接口开始
	/**
	 * 登陆判断用户名密码是否正确
	 */
	public function login(){
	$this->load->model('student_model');
		$studentNo=$this->input->get('studentNo');
		$password=$this->input->get('password');
		$query_data=array();
		if(!empty($studentNo)){
			$query_data=array(
				"studentNo"=>$studentNo	
			);
			$res_query=$this->student_model->result($query_data);			
			//print_r($res_query);
			if(!empty($res_query)){
				$password_local= $res_query[0]->password;			
				if($password==$password_local){				
					$this->result_code = "2000";
					$this->result_msg = "success";	
					$this->resultJSON = array (
							"msg" => $this->result_msg,
							"code" => $this->result_code,
							"data" => $this->result_data
					);
					echo $this->callback . "(" . json_encode ( $this->resultJSON ) . ")";
				}else{
					$this->result_code = "4001";
					$this->result_msg = "fail";
					$this->resultJSON = array (
							"msg" => $this->result_msg,
							"code" => $this->result_code,
							"data" => $this->result_data
					);
					echo $this->callback . "(" . json_encode ( $this->resultJSON ) . ")";
					
				}
			}else{
				$this->result_code = "4001";
				$this->result_msg = "fail";
				$this->resultJSON = array (
						"msg" => $this->result_msg,
						"code" => $this->result_code,
						"data" => $this->result_data
				);
				echo $this->callback . "(" . json_encode ( $this->resultJSON ) . ")";
			}
			//$this->__outmsg($res_query);
		}
		
	}
	/**
	 * 注册学生用户
	 */
	public function register(){
		$studentNo=$this->input->get('studentNo');
		$password=$this->input->get('password');
		$this->load->model('student_model');
		$query_data=array(
				'studentNo'=>$studentNo,
				'password'=>$password,
				'create_time'=>mktime(),
				'studentName'=>"请更新信息",
		);
		$res_query = $this->student_model->insert( $query_data );
		$this->result_code = "2000";
		$this->result_msg = "success";	
		$this->resultJSON = array (
				"msg" => $this->result_msg,
				"code" => $this->result_code,
				"data" => $this->result_data
		);
		echo $this->callback . "(" . json_encode ( $this->resultJSON ) . ")";		
	}
	/**
	 * 获取该学生的加入，预约，收藏的课程
	 */
	public function course(){
		$this->load->model ( 'selcourse_model' );
		$studentNo = $this->input->get ( "studentNo" );
		$query_data = array ();
		if (! empty ( $studentNo )) {
			$query_data = array (
					"studentNo" => $studentNo
			);
			$res_query = $this->selcourse_model->result ( $query_data );
			//print_r($res_query);
			$this->__outmsg ( $res_query );
		}		
	}	
	/**
	 * 加入，预约，收藏课程
	 */
	public function insert_course(){
		$this->load->model ( 'selcourse_model' );
		$selStatus = $this->input->get ( "selStatus" );
		$selDate=date('Y-m-d H:i:s',time());;
		$studentNo = $this->input->get ( "studentNo" );
		$courseNo = $this->input->get ( "courseNo" );
		//echo $selStatus.$selDate.$studentNo.$courseNo;		
		$query_data = array (
				"selStatus"=>$selStatus,
				"selDate"=>$selDate,
				"studentNo" => $studentNo,
				"courseNo"=>$courseNo
		);
		
		$res_query = $this->selcourse_model->insert ( $query_data );
		//print_r($res_query);
		$this->__outmsg ( $res_query );		
	}
	
	/**
	 * 根据课程分类号获取课程列表
	 */
	public function course_list() {
		$this->load->model ( 'course_model' );
		$courseCategory = $this->input->get ( "courseCategory" );
		$number = $this->input->get ( 'number' );
		$page = $this->input->get ( "page" );
		$where = "";
		if (empty ( $courseCategory )) {
			$where = " where 1=1";
		} else {
			$where = " where courseCategory=" . $courseCategory;
		}
		$number = empty ( $number ) ? 3 : $number;
		$page = (empty ( $page ) ? 0 : ($page - 1)) * $number;
		$where .= " order by id asc ";
		$where .= " limit " . $page . ", " . $number;		
		$tableName = "hj_u_m_courses";
		$datafield = " * ";
		$sql = "select " . $datafield . " from  " . $tableName . $where;		
		$reDataArr = $this->db->query ( $sql )->result ();
		$this->__outmsg ( $reDataArr );
	}	
	/**
	 * 根据课程号获取课程内容
	 */
	public function course_cont() {
		$this->load->model ( 'course_model' );
		$courseNo = $this->input->get ( "courseNo" );
		$query_data = array ();
		if (! empty ( $courseNo )) {
			$query_data = array (
					"courseNo" => $courseNo
			);
		}
		$res_query = $this->course_model->result ( $query_data );		
		$this->__outmsg ( $res_query );
	}
	/**
	 * 搜索课程
	 */
	public function search_course(){
		$this->load->model ( 'course_model' );
		$keyword = $this->input->get ( "keyword" );
		$query_data = array ();
		if (! empty ( $keyword )) {
			$query_data = array (
					"courseName" => $keyword
			);
			$res_query = $this->course_model->result ( $query_data );
			$this->__outmsg ( $res_query );
		}
	}	
	/**
	 * 获取通知列表
	 */
	 /*
	public function notice_list() {
		$this->load->model ( 'notify_model' );
		$noticeNo = $this->input->get ( "noticeNo" );
		$query_data = array ();
		if (! empty ( $noticeNo )) {
			$query_data = array (
					"noticeNo" => $noticeNo
			);
		}
		$res_query = $this->notify_model->result ( $query_data );
		$this->__outmsg ( $res_query );
	}
	*/
	/**
	 * 根据通知号获取通知内容和列表，如果为空的话就是获取列表数据
	 */
	public function notice_cont() {
		$this->load->model ( 'notify_model' );
		$noticeNo = $this->input->get ( 'noticeNo' );
		$query_data = array ();
		if (! empty ( $noticeNo )) {
			$query_data = array (
					"noticeNo" => $noticeNo 
			);			
		}
		$res_query = $this->notify_model->result ( $query_data );
		$this->__outmsg ( $res_query );
	}
	
	/**
	 * 根据用户获取通知消息列表
	 */
	 /*
	public function message_list(){
		$this->load->model ( 'message_model' );
		$studentNo = $this->input->get ( 'studentNo' );
		$query_data = array ();
		if (! empty ( $studentNo )) {
			$query_data = array (
					"studentNo" => $studentNo
			);
		}
		$res_query = $this->message_model->result ( $query_data );
		$this->__outmsg ( $res_query );		
	}
	*/
	/**
	 * 根据学号获取通知消息内容，适用于相互交流
	 */
	public function message_cont() {
		$this->load->model ( 'message_model' );
		$studentNo = $this->input->get ( 'studentNo' );
		$query_data = array ();
		if (! empty ( $studentNo )) {
			$query_data = array (
					"studentNo" => $studentNo
			);
			$res_query = $this->message_model->result ( $query_data );
			$this->__outmsg ( $res_query );
		}
		
	}
	
	
	/**
	 * 根据消息号获取通知消息内容
	 */
	public function message_cont_messageNo() {
		$this->load->model ( 'message_model' );
		$messageNo = $this->input->get ( 'messageNo' );
		$query_data = array ();
		if (! empty ( $messageNo )) {
			$query_data = array (
					"messageNo" => $messageNo
			);		
		}
		$res_query = $this->message_model->result ( $query_data );
		$this->__outmsg ( $res_query );
	}
	
	/**
	 * 获取学生数据信息
	 */
	public function student_cont(){
		$this->load->model('student_model');
		$studentNo=$this->input->get('studentNo');
		$query_data=array();
		if(!empty($studentNo)){
			$query_data=array(
				"studentNo"=>$studentNo	
			);			
		}
		$res_query=$this->student_model->result($query_data);
		$this->__outmsg($res_query);		
	}
	/**
	 * 修改学生数据信息
	 */
	public function alter_student(){
		$this->load->model('student_model');
		$studentNo=$this->input->get('studentNo');
		$studentName = $this->input->get ( "studentName" );
		$update_time=date('Y-m-d H:i:s',time());;
		$idCard = $this->input->get ( "idCard" );
		$address = $this->input->get ( "address" );
		$password = $this->input->get ( "password" );
		//echo $studentNo.$studentName.$idCard.$address.$password;
		$query_data=array();		
		$query_data=array(				
				"studentName"=>$studentName,
				"update_time"=>$update_time,
				"idCard"=>$idCard,
				"address" => $address,
				"password"=>$password
		);
		//print_r($query_data);
		$whereArr=array();
		$whereArr=array(
			"studentNo"=>$studentNo
		);
		//print_r($whereArr);
		$res_query=$this->student_model->update($query_data,$whereArr);
		//$this->__outmsg($res_query);
		$this->result_code = "2000";
		$this->result_msg = "success";
		$this->resultJSON = array (
				"msg" => $this->result_msg,
				"code" => $this->result_code,
				"data" => $this->result_data
		);
		echo $this->callback . "(" . json_encode ( $this->resultJSON ) . ")";
	}
	
	/**
	 * 获取教师数据信息
	 */
	public function teacher_cont(){
		$this->load->model('teacher_model');
		$teacherNo=$this->input->get('teacherNo');
		$query_data=array();
		if(!empty($teacherNo)){
			$query_data=array(
					"teacherNo"=>$teacherNo
			);			
		}
		$res_query=$this->teacher_model->result($query_data);
		$this->__outmsg($res_query);
	}
	/**
	 * 获取学院数据信息
	 */
	public function institute_cont(){
		$this->load->model('institute_model');
		$instituteNo=$this->input->get('instituteNo');
		$query_data=array();
		if(!empty($instituteNo)){
			$query_data=array(
					"instituteNo"=>$instituteNo
			);			
		}
		$res_query=$this->institute_model->result($query_data);
		$this->__outmsg($res_query);
	}	
	/**
	 * 获取评价数据信息
	 */
	public function evaluate_cont(){
		$this->load->model('evaluate_model');
		$courseNo=$this->input->get('courseNo');
		$query_data=array();
		if(!empty($courseNo)){
			$query_data=array(
					"courseNo"=>$courseNo
			);
			$res_query=$this->evaluate_model->result($query_data);
			$this->__outmsg($res_query);
		}
	}	
	//定义数据接口结束	
	/**
	 * 定义数据结构结束
	 */
	private function __filterVal($var) {
		$result = (isset ( $var )) ? $var : "";
		return $result;
	}
	private function __outmsg($reDataArr) {
		if (sizeof ( $reDataArr ) == 0) {
			$this->result_code = "4001";
			$this->result_msg = "data empty";
		} else {
			$this->result_code = "2000";
			$this->result_msg = "success";
		}
		$this->result_data = $reDataArr;
		$this->resultJSON = array (
				"msg" => $this->result_msg,
				"code" => $this->result_code,
				"data" => $this->result_data 
		);
		echo $this->callback . "(" . json_encode ( $this->resultJSON ) . ")";
	}
}

/* End of file webservices.php */
/* Location: ./application/controllers/webservices.php */