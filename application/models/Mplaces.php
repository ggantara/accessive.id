<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mplaces extends CI_Model {

	function get($key=null,$value=null){
		if ($key!==null) {
			$this->db->join('categories', 'places.category_id = categories.category_id', 'left');
			//ambil data places berdasarkan facility_id
			return $this->db->get_where('places',array($key =>$value ))->row_array();
		}
		// join table category
		$this->db->join('categories', 'places.category_id = categories.category_id', 'left');

		// ambil semua data dari database tabel places
		return $this->db->get('places')->result_array();
	}
	function create($inputan){
		//validasi apabila terdapat nama kategori yang sama di database dengan yang di input
		$is_place = $this->get('title',$inputan['title']);

				//jika ada atau tidak kosong maka
		if (!empty($is_place) OR isset($is_place)) {
			//gagal
			return false;
		}else{
			$inputan['place_id'] = sha1($inputan['title'].date("His"));
			$this->db->insert('places', $inputan);
			return $inputan['place_id'];
		}
	}
	function update($inputan,$placeId){

			//ambil data place lama
		$is_place = $this->get('place_id',$placeId);

		if ($is_place['title']==$inputan['title']) {
			$this->db->update('places', $inputan,array('place_id'=>$placeId));
			return true;
		}else{

			$isplace = $this->get('title',$inputan['title']);

			if (!empty($isplace) OR isset($isplace)) {
				return false;
			}else{
				$this->db->update('places', $inputan,array('place_id'=>$placeId));
				return true;
			}
		}

	}	

	function reviews(){

		$this->db->group_by('place_id');
		$this->db->select('COUNT(*) as total');
		$data = $this->db->get('place_reviews')->result_array();
		$total=0;
		foreach ($data as $key => $value) {
			$total+=$value['total'];
		}
		return $total;
	}

	function get_reviews($place_id){
		return $this->db->get_where('place_reviews',array('place_id'=>$place_id))->result_array();
	}

	function delete($place_id){
		$this->db->delete('places',array('place_id'=>$place_id));
	}

	function delete_photo($photo_id){
		$this->db->delete('place_photos',array('place_photo_id'=>$photo_id));
	}

	function get_photos($place_id){
		return $this->db->get_where('place_photos',array('place_id'=>$place_id))->result_array();
	}

	function get_facilities($place_id){
		
		$this->db->join('facilities', 'place_facilities.facility_id = facilities.facility_id', 'left');
		return $this->db->get_where('place_facilities',array('place_id'=>$place_id))->result_array();
	}

	function getPlaceFacilities(){

		$places = $this->get();

		$semua=array();

		foreach ($places as $key => $value) {
			
			$value['facilities'] = $this->get_facilities($value['place_id']);
			$semua[] = $value;
		}

		return $semua; 
	}

	function create_facilities($facilities,$place_id){

		$cek = $this->get_facilities($place_id);

		if(empty($cek)){

			foreach ($facilities as $facility_id => $on) {

				$inputan['place_facility_id'] = sha1($facility_id.$place_id);
				$inputan['facility_id']=$facility_id;
				$inputan['place_id']=$place_id;
				$inputan['is_facility_available']=1;

				$this->db->insert('place_facilities', $inputan);
			}
		}else{

			$this->db->delete('place_facilities',array('place_id'=>$place_id));
			foreach ($facilities as $facility_id => $on) {

				$inputan['place_facility_id'] = sha1($facility_id.$place_id);
				$inputan['facility_id']=$facility_id;
				$inputan['place_id']=$place_id;
				$inputan['is_facility_available']=1;

				$this->db->insert('place_facilities', $inputan);
			}
		}

	}

	function create_photos($inputan,$place_id){

		$cek = $this->get_photos($place_id);
		
		if(empty($cek)){

			foreach ($inputan['place_photo_url'] as $key => $url_photo) {

				$data['place_photo_url']=$url_photo;
				$data['place_id']=$place_id;

				$data['place_photo_id'] = sha1(date("YmdHis").$key);

				$this->db->insert('place_photos', $data);
			}
		}else{

			foreach ($inputan['place_photo_url'] as $key => $url_photo) {

				$data['place_photo_url']=$url_photo;
				$data['place_id']=$place_id;

				$data['place_photo_id'] = sha1(date("YmdHis").$key);

				$this->db->insert('place_photos', $data);
			}
		}
	}
}