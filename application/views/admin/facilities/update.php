<div class="box box-info">	
	<div class="box-header">
			<h3 class="box-title">Ubah Data Fasilitas</h3>	
	</div>
	<form method="POST">	
		<div class="box-body">
			<div class="form-group">
				<label for="facilityName">Nama Fasilitas</label>
				<input type="text" id="facilityName" class="form-control"
				 name="facility_name" value="<?php echo $facility['facility_name']; ?>">
			</div>

			<div class="form-group">
				<label for="facilityName">Informasi Fasilitas</label>
				<textarea id="facilityInfo" class="form-control"
				style="height: 100px" name="facility_info"><?php echo $facility['facility_info']; ?></textarea>
			</div>
			<div class="form-group">
				<label for="facilityIcon">Lambang untuk Fasilitas yang Tersedia saat ini</label>
				<br>
				<img src="<?php echo $facility['facility_icon'] ?>">
				<br>
				<p>pilih lambang baru melalui choose file</p>
				<input type="file" id="facilityIcon" class="form-control"
				name="facility_icon" value="<?php echo $facility['facility_icon']; ?>">
			</div>
			<div class="form-group">
				<label for="facilityUnavailableIcon">Lambang untuk Fasilitas yang Tidak Tersedia saat ini</label>
				<br>
				<img src="<?php echo $facility['facility_unavailable_icon'] ?>">
				<br>
				<p>pilih lambang baru melalui choose file</p>
				<input type="file" id="facilityUnavailableIcon" class="form-control"
				name="facility_unavailable_icon" value="<?php echo $facility['facility_unavailable_icon']; ?>">
			</div>
			<div class="form-group">
				<label for="placePhotos">Url Photos</label>
				<input type="text" class="form-control ikon_ada" name="facility_icon">
			</div>
			<div class="form-group">
				<label for="placePhotos">Url Photos</label>
				<input type="text" class="form-control ikon_tidak" name="facility_unavailable_icon">
			</div>
		</div>
		<div class="box-footer">
		<button class="btn-primary btn btn-sm"><i class="fa fa-save"></i><span>	Simpan</span></button>
		<a href="<?php echo base_url('admin/facilities') ?>" class="btn-primary btn btn-sm">Kembali</a>	
		</div>
	</form>
</div>

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.0.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.0.0/firebase-storage.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.0.0/firebase-auth.js"></script>
<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
  	apiKey: "AIzaSyBIqINA3EPXS5G_0Kc8Hm4RVtnSH1HPCO8",
  	authDomain: "accessive-655f9.firebaseapp.com",
  	databaseURL: "https://accessive-655f9.firebaseio.com",
  	projectId: "accessive-655f9",
  	storageBucket: "accessive-655f9.appspot.com",
  	messagingSenderId: "1053172432472",
  	appId: "1:1053172432472:web:c9e8636d5a304d9ed6942d"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);


// menampung url foto yang di upload
var fileList = [];
  // mengambil foto yang di pilih yang memiliki id place photos
  var fileicontidak = document.getElementById('facilityUnavailableIcon');
  var fileiconada = document.getElementById('facilityIcon');
  // saat pemilihan foto
  fileiconada.addEventListener('change', function (evnt) {
  	// perulangan jumlah foto yang dipilih
  	var filenameada = fileiconada.files[0].name;
  		// mengambil data setiap foto
  		var fileada = fileiconada.files[0];
  		var filetidak = fileicontidak.files[0];
  		// upload foto ke storage firebase sesuai nama foldernya
  		var storageRefada = firebase.storage().ref('Access Facility Icon/'+filenameada);

  		// memasukan foto ke dalam firebase
  		// console.log(filenametidak);
  		var taskada = storageRefada.put(fileada);

  	// mengisikan url
  	document.querySelector(".ikon_ada").value = filenameada;
  });

  fileicontidak.addEventListener('change', function (evnt) {
  	var filenametidak = fileicontidak.files[0].name;
  		// mengambil data setiap foto
  		var filetidak = fileicontidak.files[0];

  		var storageReftidak = firebase.storage().ref('Access Facility Icon/'+filenametidak);

  		var tasktidak = storageReftidak.put(filetidak);

  	// mengisikan url
  	
  	document.querySelector(".ikon_tidak").value = filenametidak;
  });
</script>