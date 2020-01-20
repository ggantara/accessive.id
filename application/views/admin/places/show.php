<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Data Tempat</h3>
	</div>
	<div class="box-body">
		<table class="table" id="myTable">
			<thead>	
				<tr>	
					<th>no</th>
					<th>Nama Tempat</th>
					<th>Kategori Tempat</th>
					<th>Alamat</th>
					<th>Nomor Telepon</th>
					<th>Website</th>
					<th>Rating</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($places as $key => $value): ?>
					<tr>
						<td><?php echo $key+1; ?></td>
						<td><?php echo $value['title']; ?></td>
						<td><?php echo $value['category_name']; ?></td>
						<td><?php echo $value['address']; ?></td>
						<td><?php echo $value['phone_number']; ?></td>
						<td><?php echo $value['website']; ?></td>
						<td><span><?php echo round($value['average_rating'],1); ?></span> <i class="fa fa-star" style="color: gold;"></i></td>
						<td nowrap="">	

							<a href="<?php echo base_url("admin/places/detail/".$value['place_id']) ?>">Detail</a>

							<span>|</span>

							<a href="<?php echo base_url("admin/places/reviews/".$value['place_id']) ?>">Ulasan</a>

							<span>|</span>

							<a href="<?php echo base_url("admin/places/update/".$value['place_id']) ?>">Ubah</a>

							<span>|</span>

							<a href="<?php echo base_url("admin/places/delete/".$value['place_id']) ?>"
								onclick="return confirm('Are you sure want to delete?')">Hapus</a>
							</td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>

		</div>
		<div class="box-footer">
			<a href="<?php echo base_url("admin/places/create"); ?>" class="btn btn-primary btn-sm">Tambahkan Data Tempat</a>
		</div>
	</div>