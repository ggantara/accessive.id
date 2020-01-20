<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Data Fasilitas</h3>
	</div>
	<div class="box-body">
		<table class="table" id="myTable">
			<thead>	
				<tr>	
					<th>no</th>
					<th>Nama Fasilitas</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($facilities as $key => $value): ?>
					<tr>
						<td><?php echo $key+1; ?></td>
						<td><?php echo $value['facility_name']; ?></td>
						<td>	
							<a href="<?php echo base_url("admin/facilities/detail/".$value['facility_id']) ?>">
							Detail</a>

							<span>|</span>

							<a href="<?php echo base_url("admin/facilities/update/".$value['facility_id']) ?>">Ubah</a>

							<span>|</span>

							<a href="<?php echo base_url("admin/facilities/delete/".$value['facility_id']) ?>"
								onclick="return confirm('Are you sure want to delete?')"
								>Hapus</a>
							</td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>

		</div>
		<div class="box-footer">
			<a href="<?php echo base_url("admin/facilities/create"); ?>" class="btn btn-primary btn-sm">Tambah Fasilitas Baru</a>
		</div>
	</div>