<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mcategory extends CI_Model {

	function get($key=null,$value=null){
		if ($key!==null) {
			//ambil data categories berdasarkan category_id
			return $this->db->get_where('categories',array($key =>$value ))->row_array();
		}
		// ambil semua data dari database tabel categories
		return $this->db->get('categories')->result_array();
	}	

	function create($inputan){
		//validasi apabila terdapat nama kategori yang sama di database dengan yang di input
		$is_category = $this->get('category_name',$inputan['category_name']);

				//jika ada atau tidak kosong maka
		if (!empty($is_category) OR isset($is_category)) {
			//gagal
			return false;
		}else{
			$inputan['category_id'] = sha1($inputan['category_name']);
			$this->db->insert('categories', $inputan);
			return true;
		}
	}

	function delete($categoryId){
		$this->db->delete('categories',array('category_id'=>$categoryId));
	}

	function update($inputan,$categoryId){

			//ambil data category lama
		$is_category = $this->get('category_id',$categoryId);

		if ($is_category['category_name']==$inputan['category_name']) {
			$this->db->update('categories', $inputan,array('category_id'=>$categoryId));
			return true;
		}else{

			$isCategory = $this->get('category_name',$inputan['category_name']);

			if (!empty($isCategory) OR isset($isCategory)) {
				return false;
			}else{
				$this->db->update('categories', $inputan,array('category_id'=>$categoryId));
				return true;
			}
		}

	}

}

/* End of file Mcategory.php */
/* Location: ./application/models/Mcategory.php */