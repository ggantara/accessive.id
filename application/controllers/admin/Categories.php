<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Categories extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('Mcategory');
		if (!$this->session->userdata('akun')) {
				redirect('login','refresh');
		}
	}		

	public function index()
	{
		$data['categories'] = $this->Mcategory->get();

		$konten['konten'] = $this->load->view('admin/categories/show', $data, True);

		$this->load->view('admin/index', $konten, FALSE);
	}

	public function create()
	{
		$konten['konten'] = $this->load->view('admin/categories/create', $data=null, True);
		$this->load->view('admin/index', $konten, FALSE);
		if($this->input->post()){

			$cek = $this->Mcategory->create($this->input->post());
			
			if($cek==true){
				redirect('admin/categories','refresh');
			}else{
				echo "<script>alert('category already exist');</script>";
			}
		}

	}

	public function update($categoryId)
	{

		$data['category'] = $this->Mcategory->get('category_id',$categoryId);	

		$konten['konten'] = $this->load->view('admin/categories/update', $data, True);
		$this->load->view('admin/index', $konten, FALSE);
		if($this->input->post()){

			$cek = $this->Mcategory->update($this->input->post(),$categoryId);
			
			if($cek==true){
				redirect('admin/categories','refresh');
			}else{
				echo "<script>alert('category already exist');</script>";
			}
		}
	}

	public function delete($categoryId)
	{
		$this->Mcategory->delete($categoryId);
		redirect('admin/categories','refresh');
	}

}

/* End of file Category.php */
/* Location: ./application/controllers/admin/Category.php */