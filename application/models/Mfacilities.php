<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mfacilities extends CI_Model {

	function get($key=null,$value=null){
		if ($key!==null) {
			//ambil data facilities berdasarkan facility_id
			return $this->db->get_where('facilities',array($key =>$value ))->row_array();
		}
		// ambil semua data dari database tabel facilities
		return $this->db->get('facilities')->result_array();
	}	
	function create($inputan){

		$inputan['facility_icon'] = "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2F".$inputan['facility_icon']."?alt=media";
		$inputan['facility_unavailable_icon'] = "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2F".$inputan['facility_unavailable_icon']."?alt=media";
		//validasi apabila terdapat nama kategori yang sama di database dengan yang di input
		$is_facility = $this->get('facility_name',$inputan['facility_name']);

				//jika ada atau tidak kosong maka
		if (!empty($is_facility) OR isset($is_facility)) {
			//gagal
			return false;
		}else{
			$inputan['facility_id'] = sha1($inputan['facility_name']);
			$this->db->insert('facilities', $inputan);
			return true;
		}
	}
	function delete($facilityId){
		$this->db->delete('facilities',array('facility_id'=>$facilityId));
	}
	function update($inputan,$facilityId){

		$inputan['facility_icon'] = "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2F".$inputan['facility_icon']."?alt=media";
		$inputan['facility_unavailable_icon'] = "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2F".$inputan['facility_unavailable_icon']."?alt=media";
			//ambil data facility lama
		$is_facility = $this->get('facility_id',$facilityId);

		if ($is_facility['facility_name']==$inputan['facility_name']) {
			$this->db->update('facilities', $inputan,array('facility_id'=>$facilityId));
			return true;
		}else{

			$isfacility = $this->get('facility_name',$inputan['facility_name']);

			if (!empty($isfacility) OR isset($isfacility)) {
				return false;
			}else{
				$this->db->update('facilities', $inputan,array('facility_id'=>$facilityId));
				return true;
			}
		}

	}

}

/* End of file Mfacilities.php */
/* Location: ./application/models/Mfacilities.php */