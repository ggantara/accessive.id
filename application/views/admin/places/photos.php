<!-- <pre>
	<?php print_r($place_photos); ?>
</pre> -->
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Foto Fasilitas Tempat</h3>
	</div>

	<form method="POST">
		<div class="box-body">
			<div class="form-group">
				<label for="placePhotos">Pilih Foto</label>
				<input type="file" class="form-control" id="placePhotos" multiple="">
			</div>
			<div class="form-group hidden">
				<label for="placePhotos">Url Photos</label>
				<input type="text" class="form-control place_photo_url" name="place_photo_url">
			</div>
      <div class="form-group">
        <label for="placePhotos">Foto yang ada</label>
      </div>
			<?php foreach ($place_photos as $key => $value): ?>
				<div class="col-md-3">
					<img src="<?php echo $value['place_photo_url'] ?>" class="img-responsive">
				</div>
			<?php endforeach ?>
		</div>
		<div class="box-footer">
			<button class="btn-primary btn btn-sm"><i class="fa fa-save"></i><span>	Simpan</span></button>	
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
  var fileInput = document.getElementById('placePhotos');
  // saat pemilihan foto
  fileInput.addEventListener('change', function (evnt) {
  	fileList = [];
  	// perulangan jumlah foto yang dipilih
  	for (var i = 0; i < fileInput.files.length; i++) {
  		// mengambil nama setiap foto
  		var filename = fileInput.files[i].name;
  		// mengambil data setiap foto
  		var file = fileInput.files[i];
  		// upload foto ke storage firebase sesuai nama foldernya
  		var storageRef = firebase.storage().ref('Access Place Photos/'+filename+i);

  		<?php if(!empty($place_photos)): ?>
  			<?php foreach ($place_photos as $key => $value): ?>
  				var desertRef<?php echo $key; ?> = storageRef.child('images/ia%20ugm.jpg0');
				// Delete the file
				desertRef<?php echo $key; ?>.delete().then(function() {
				  // File deleted successfully
				}).catch(function(error) {
				  // Uh-oh, an error occurred!
				});
			<?php endforeach ?>
		<?php endif ?>

  		// memasukan foto ke dalam firebase
  		var task = storageRef.put(file);
  		fileList.push("https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F"+filename+i+"?alt=media");
  	}
  	// mengisikan url
  	document.querySelector(".place_photo_url").value = JSON.stringify(fileList);
  });
</script>