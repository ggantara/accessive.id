<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Facilities extends CI_Controller {

	
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('Mfacilities');
		if (!$this->session->userdata('akun')) {
				redirect('login','refresh');
		}
	}		

	public function index()
	{
		$data['facilities'] = $this->Mfacilities->get();

		$konten['konten'] = $this->load->view('admin/facilities/show', $data, True);

		$this->load->view('admin/index', $konten, FALSE);
	}

	function detail($facilityId)
	{
		$data['facilities'] = $this->Mfacilities->get('facility_id', $facilityId);

		$konten['konten'] = $this->load->view('admin/facilities/detail', $data, True);

		$this->load->view('admin/index', $konten, FALSE);
	}
	public function create()
	{
		$konten['konten'] = $this->load->view('admin/facilities/create', $data=null, True);
		$this->load->view('admin/index', $konten, FALSE);
		if($this->input->post()){
			$cek = $this->Mfacilities->create($this->input->post());
			
			if($cek==true){
				redirect('admin/facilities','refresh');
			}else{
				echo "<script>alert('facility already exist');</script>";
			}
		}

	}
	public function update($facilityId)
	{

		$data['facility'] = $this->Mfacilities->get('facility_id',$facilityId);	

		$konten['konten'] = $this->load->view('admin/facilities/update', $data, True);
		$this->load->view('admin/index', $konten, FALSE);
		if($this->input->post()){

			$cek = $this->Mfacilities->update($this->input->post(),$facilityId);
			
			if($cek==true){
				redirect('admin/facilities','refresh');
			}else{
				echo "<script>alert('facility already exist');</script>";
			}
		}
	}
	public function delete($facilityId)
	{
		$this->Mfacilities->delete($facilityId);
		redirect('admin/facilities','refresh');
	}
	

}

/* End of file Facilities.php */
/* Location: ./application/controllers/admin/Facilities.php */