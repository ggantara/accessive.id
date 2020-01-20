<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mfacilities");
		$this->load->model("Mcategory");
		$this->load->model("Mplaces");
		if (!$this->session->userdata('akun')) {
				redirect('login','refresh');
		}
	}

	public function index()
	{

		$data['facility'] = $this->Mfacilities->get();
		$data['place'] = $this->Mplaces->getPlaceFacilities();
		$data['category'] = $this->Mcategory->get();
		$data['review'] = $this->Mplaces->reviews();

		$konten['konten'] =$this->load->view('admin/dashboard', $data, True);
		$this->load->view('admin/index', $konten);
	}

}

/* End of file Welcome.php */
/* Location: ./application/controllers/admin/Welcome.php */