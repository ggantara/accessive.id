<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Nama Tempat : <?php echo $place['title'] ?></h3>
	</div>
	<div class="box-body">
		<div class="row">
			<div class="col-md-6">
				<div id="map"></div>
			</div>
			<div class="col-md-6">
				<h3>Rating</h3>
				<h1>
					<span><?php echo round($place['average_rating'],1); ?></span> <i class="fa fa-star" style="color: gold;"></i>
				</h1>
				<hr>
				<h4>Informasi Tempat</h4>
				<ul style="list-style: none;padding: 0;">
					<li> <i class="fa fa-tags"></i> <span> kategori tempat: </span> <span><?php echo $place['category_name'] ?></span></li>
					<li><i class="fa fa-phone  "></i> <span> nomor telepon: </span> <span><?php echo $place['phone_number'] ?></span></li>
					<li><i class="fa fa-globe  "></i> <span> website: </span> <span><?php echo $place['website'] ?></span></li>
					<li><i class="fa fa-map-marker"></i> <span> alamat: </span> <span><?php echo $place['address'] ?></span></li>
				</ul>
			</div>
		</div>

	</div>
	<div class="box box-info">
		<div class="box-header">
			<h3 class="box-title">Foto Fasilitas Tempat</h3>
		</div>
		<div class="box-body row">
			<?php foreach ($photos as $key => $value): ?>
				<div class="col-md-4">
					<img src="<?php echo $value['place_photo_url'] ?>" alt="<?php echo $value['place_photo_url'] ?>" class="img-thumbnail img-responsive">
				<div class="text-center">
					<a href="<?php echo base_url("admin/places/delete_photo/".$value['place_id']."/".$value['place_photo_id']); ?>" onclick="return confirm('Are you sure want to delete?')" class="btn btn-danger">Hapus Foto</a>
				</div>
				</div>
				<?php endforeach ?>
			</div>	
		</div>
		<div class="box-info">
			<div class="box-header">
				<h3 class="box-title">Fasilitas yang Tersedia</h3>
				<br>
				<p>Biru menandakan bahwa fasilitas tersedia, sedangkan merah menandakan bahwa fasilitas tidak tersedia</p>
			</div>
		</div>
		<div class="box-body">
			<?php foreach ($facilities as $key => $value): ?>
				<div class="col-md-2">
					<div class="thumbnail">
						<?php if (in_array($value['facility_id'],$facility)): ?>
							<img src="<?php echo $value['facility_icon'] ?>" alt="<?php echo $value['facility_icon'] ?>" class="img-thumbnail img-responsive">
							<?php else: ?>
								<img src="<?php echo $value['facility_unavailable_icon'] ?>" alt="<?php echo $value['facility_unavailable_icon'] ?>" class="img-thumbnail img-responsive">
							<?php endif ?>
							<div class="caption"> <?php echo $value['facility_name']; ?> </div>
						</div>
					</div>
				<?php endforeach ?>
			</div>
			<div class="box-footer">
				<a href="<?php echo base_url("admin/places"); ?>" class="btn btn-primary btn-sm">Kembali</a>
			</div>
		</div>
		<script>
			function initMap() {
			// menampilkan latitude dan longitude
			var center = {lat: <?php echo $place['latitude'] ?>, lng: <?php echo $place['longitude'] ?>};
			// memanggil google maps
			var map = new google.maps.Map(
				// menampilkan peta pada div id map serta mengatur zoom dan lat and long
				document.getElementById('map'), {zoom: 14, center: center});
			// memberikan marker pada google maps
			var marker = new google.maps.Marker({position: center, map: map});
		}
	</script>
	<!-- memanggil api google maps -->
	<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZlgi_GjRxGAd-wPYqU9y-lp4PQSA-j1o&callback=initMap"></script>