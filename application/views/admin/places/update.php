<div class="box box-info">	
	<div class="box-header">
		<h3 class="box-title">Ubah Data Tempat</h3>	
	</div>
	<!-- <pre>
		<?php print_r($place); ?>
	</pre> -->
	<form method="POST">	
		<div class="box-body">
			<div class="form-group">
				<label for="placeName">Nama Tempat</label>
				<input type="text" id="placeName" class="form-control"
				name="title" value="<?php echo $place['title']; ?>">
			</div>
			<div class="form-group">
				<label for="category">Kategori Tempat</label>
				<select name="category_id" class="form-control">
					<option>Pilih Kategori Tempat</option>
					<?php foreach ($categories as $key => $value): ?>
						<option value="<?php echo $value['category_id'] ?>" <?php if($place['category_id']==$value['category_id']){echo "selected";} ?>><?php echo $value['category_name'] ?></option>
					<?php endforeach ?>
				</select>
			</div>
			<div class="form-group">
				<label for="Address">Alamat</label>
				<p>Alamat akan otomatis muncul setelah memilih lokasi lewat peta di bawah</p>
				<textarea id="Address" class="form-control"
				style="height: 100px" name="address" readonly=""><?php echo $place['address']; ?></textarea>
			</div>
			<div class="form-group">
				<label for="phoneNumber">Nomor Telepon</label>
				<input type="text" id="phoneNumber" class="form-control"
				name="phone_number" value="<?php echo $place['phone_number'] ?>">
			</div>
			<div class="form-group">
				<label for="website">Website</label>
				<input type="text" id="website" class="form-control"
				name="website" value="<?php echo $place['website'] ?>">
			</div>
			<div class="form-group hidden">
				<label for="website">Lat</label>
				<input type="text" id="lat" class="form-control" name="latitude">
			</div>
			<div class="form-group hidden">
				<label for="website">Lng</label>
				<input type="text" id="lng" class="form-control" name="longitude">
			</div>

			<div class="form-group">
				<label>Pilih Lokasi</label>
				<p>Memilih lokasi dilakukan dengan menggeser penanda berwarna merah ke tempat yang di inginkan</p>
				<div id="peta"></div>
			</div>
		</div>
		<div class="box-footer">
			<button class="btn-primary btn btn-sm"><i class="fa fa-save"></i><span>	Simpan</span></button>
			<a href="<?php echo base_url("admin/places"); ?>" class="btn btn-primary btn-sm">Kembali</a>	
		</div>
	</form>
</div>
<script type="text/javascript">
	function initMap() {
		var center = {lat: <?php echo $place['latitude'] ?>, lng: <?php echo $place['longitude'] ?>};
		var map = new google.maps.Map(
			document.getElementById('peta'), {zoom: 14, center: center});
		
// Place a draggable marker on the map
var marker = new google.maps.Marker({
	position: center,
	map: map,
	draggable:true,
	title:"Choose Location"
});

var infowindow = new google.maps.InfoWindow();

var geocoder = new google.maps.Geocoder();

google.maps.event.addListener(marker, 'dragend', function () {

	geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[0]) {
				$('#Address').val(results[0].formatted_address);
				$('#lat').val(marker.getPosition().lat());
				$('#lng').val(marker.getPosition().lng());
				infowindow.setContent(results[0].formatted_address);
				infowindow.open(map, marker);
			}
		}
	});
});
}

</script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAm6Z-CVqOZ_abridFVNriw8ct993G4gpw&callback=initMap"></script>