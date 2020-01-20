<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {


	function __construct()
	{
		parent::__construct();
		$this->load->model('Mlogin');
	}		

	public function index()
	{	
		$this->load->view('login');
		if($this->input->post()){

			$cek = $this->Mlogin->login_admin($this->input->post());

			if($cek==true){
				redirect('admin/welcome','refresh');
			}else{
				echo '<script language="javascript">';
				echo 'alert("incorrect email or password")';
				echo '</script>';
			}
		}
	}

}

/* End of file Login.php */
/* Location: ./application/controllers/Login.php */