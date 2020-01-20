<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Places extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('Mplaces');
		$this->load->model('Mcategory');
		$this->load->model('Mfacilities');
		if (!$this->session->userdata('akun')) {
				redirect('login','refresh');
		}
	}		

	public function index()
	{
		$data['places'] = $this->Mplaces->get();

		$konten['konten'] = $this->load->view('admin/places/show', $data, True);

		$this->load->view('admin/index', $konten, FALSE);
	}

	public function reviews($place_id){

		$data['reviews'] = $this->Mplaces->get_reviews($place_id);

		$data['places'] = $this->Mplaces->get('place_id', $place_id);

		$konten['konten'] = $this->load->view('admin/places/review', $data, True);

		$this->load->view('admin/index', $konten, FALSE);	
	}

	public function delete($place_id){
		$this->Mplaces->delete($place_id);
		redirect('admin/places','refresh');
	}
	
	public function detail($place_id)
	{
		$data['place'] = $this->Mplaces->get('place_id', $place_id);

		$data['photos'] = $this->Mplaces->get_photos($place_id);

		$facilities = $this->Mplaces->get_facilities($place_id);

		$data['facilities'] = $this->Mfacilities->get();

		foreach ($facilities as $key => $value) {
			$semua[]=$value['facility_id'];
		}

		$data['facility'] = $semua;

		$konten['konten'] = $this->load->view('admin/places/detail', $data, True);

		$this->load->view('admin/index', $konten, FALSE);
	}
	public function create()
	{
		$data['categories'] = $this->Mcategory->get();

		$konten['konten'] = $this->load->view('admin/places/create', $data, True);
		$this->load->view('admin/index', $konten, FALSE);
		if($this->input->post()){

			$cek = $this->Mplaces->create($this->input->post());
			
			if($cek !== false){
				redirect('admin/places/facilities/'.$cek,'refresh');
			}else{
				echo "<script>alert('place already exist');</script>";
			}
		}

	}
	public function update($placeId)
	{

		$data['place'] = $this->Mplaces->get('place_id',$placeId);	
		$data['categories'] = $this->Mcategory->get();

		$konten['konten'] = $this->load->view('admin/places/update', $data, True);
		$this->load->view('admin/index', $konten, FALSE);
		if($this->input->post()){

			$cek = $this->Mplaces->update($this->input->post(),$placeId);
			
			if($cek==true){
				redirect('admin/places/facilities/'.$placeId,'refresh');
			}else{
				echo "<script>alert('place already exist');</script>";
			}
		}
	}

	public function facilities($place_id)
	{
		$data['facilities'] = $this->Mfacilities->get();
		$facilities= $this->Mplaces->get_facilities($place_id);

		$place_facility=array();
		foreach ($facilities as $key => $value) {
			$place_facility[]=$value['facility_id'];
		}

		$data['place_facility']=$place_facility;


		$konten['konten'] = $this->load->view('admin/places/facilities', $data, True);

		$this->load->view('admin/index', $konten, FALSE);

		if($this->input->post()){

			$this->Mplaces->create_facilities($this->input->post('facilities'),$place_id);
			redirect('admin/places/photo_place/'.$place_id,'refresh');
		}

	}

	public function photo_place($place_id){

		$data['place_photos']=$this->Mplaces->get_photos($place_id);

		$konten['konten'] = $this->load->view('admin/places/photos', $data, True);

		$this->load->view('admin/index', $konten, FALSE);

		if($this->input->post()){

			$place_photo_url = str_replace('[', "", $this->input->post('place_photo_url'));
			$place_photo_url = str_replace(']', "", $place_photo_url);
			$place_photo_url = str_replace('"', "", $place_photo_url);

			$inputan['place_photo_url'] = explode(",", $place_photo_url);

			$this->Mplaces->create_photos($inputan,$place_id);

			redirect('admin/places/detail/'.$place_id,'refresh');
		}
	}

	public function delete_photo($places_id,$photo_id){
		$this->Mplaces->delete_photo($photo_id);
		redirect('admin/places/detail/'.$places_id,'refresh');
	}
}

/* End of file Places.php */
/* Location: ./application/controllers/admin/Places.php */