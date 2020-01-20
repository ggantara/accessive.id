<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Musers extends CI_Model {

	function get($key=null,$value=null){
		if ($key!==null) {
			//ambil data users berdasarkan user_id
			return $this->db->get_where('users',array($key =>$value ))->row_array();
		}
		// ambil semua data dari database tabel users
		return $this->db->get('users')->result_array();
	}	

	function create($inputan){
		//validasi apabila terdapat nama kategori yang sama di database dengan yang di input
		$is_user = $this->get('user_name',$inputan['user_name']);

				//jika ada atau tidak kosong maka
		if (!empty($is_user) OR isset($is_user)) {
			//gagal
			return false;
		}else{
			$inputan['user_id'] = sha1($inputan['user_name']);
			$this->db->insert('users', $inputan);
			return true;
		}
	}

	function delete($userId){
		$this->db->delete('users',array('user_id'=>$userId));
	}

	function update($inputan,$userId){

			//ambil data user lama
		$is_user = $this->get('user_id',$userId);

		if ($is_user['user_name']==$inputan['user_name']) {
			$this->db->update('users', $inputan,array('user_id'=>$userId));
			return true;
		}else{

			$isuser = $this->get('user_name',$inputan['user_name']);

			if (!empty($isuser) OR isset($isuser)) {
				return false;
			}else{
				$this->db->update('users', $inputan,array('user_id'=>$userId));
				return true;
			}
		}

	}

}

/* End of file Muser.php */
/* Location: ./application/models/Muser.php */