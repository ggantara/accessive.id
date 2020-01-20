<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mlogin extends CI_Model {
	function login_admin($input)
	{
		$ambil = $this->db->get_where('admin',array('email'=>$input['email']));


		if($ambil->num_rows() == 1){

			$akun = $ambil->row_array();

			if(password_verify($input['password'], $akun['password'])){

				$this->session->set_userdata('akun',$akun);

				return true;
			}

			return false;
		}

		return false;
	}

}





/* End of file Mlogin.php */
/* Location: ./application/models/Mlogin.php */